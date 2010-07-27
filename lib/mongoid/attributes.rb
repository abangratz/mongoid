# encoding: utf-8
module Mongoid #:nodoc:
  module Attributes
    extend ActiveSupport::Concern
    included do
      class_inheritable_accessor :_protected_fields
      self._protected_fields = []
    end

    # Get the id associated with this object. This will pull the _id value out
    # of the attributes +Hash+.
    def id
      @attributes["_id"]
    end

    # Set the id of the +Document+ to a new one.
    def id=(new_id)
      @attributes["_id"] = new_id
    end

    alias :_id :id
    alias :_id= :id=

    # Used for allowing accessor methods for dynamic attributes.
    def method_missing(name, *args)
      attr = name.to_s
      return super unless @attributes.has_key?(attr.reader)
      if attr.writer?
        # "args.size > 1" allows to simulate 1.8 behavior of "*args"
        write_attribute(attr.reader, (args.size > 1) ? args : args.first)
      else
        read_attribute(attr.reader)
      end
    end

    # Process the provided attributes casting them to their proper values if a
    # field exists for them on the +Document+. This will be limited to only the
    # attributes provided in the suppied +Hash+ so that no extra nil values get
    # put into the document's attributes.
    def process(attrs = nil)
      multi_parameter_attributes = []
      (attrs || {}).each_pair do |key, value|
        if key.to_s.include?("(") 
          multi_parameter_attributes << [key.to_s, value]
        else
          if set_allowed?(key)
            write_attribute(key, value)
          elsif write_allowed?(key)
            if associations.include?(key.to_s) and associations[key.to_s].embedded? and value.is_a?(Hash)
              if association = send(key)
                association.nested_build(value)
              else
                send("build_#{key}", value)
              end
            else
              send("#{key}=", value)
            end
          end
        end
      end
      assign_multiparameter_attributes(multi_parameter_attributes)
      setup_modifications
    end

    # Instantiates objects for all attribute classes that needs more than one constructor parameter. This is done
    # by calling new on the column type or aggregation type (through composed_of) object with these parameters.
    # So having the pairs written_on(1) = "2004", written_on(2) = "6", written_on(3) = "24", will instantiate
    # written_on (a date type) with Date.new("2004", "6", "24"). You can also specify a typecast character in the
    # parentheses to have the parameters typecasted before they're used in the constructor. Use i for Fixnum, f for Float,
    # s for String, and a for Array. If all the values for a given attribute are empty, the attribute will be set to nil.
    def assign_multiparameter_attributes(pairs)
      execute_callstack_for_multiparameter_attributes(
        extract_callstack_for_multiparameter_attributes(pairs)
      )
    end


    def execute_callstack_for_multiparameter_attributes(callstack)
      errors = []
      callstack.each do |name, values_with_empty_parameters|
        begin
          klass = fields[name].type
          # in order to allow a date to be set without a year, we must keep the empty values.
          # Otherwise, we wouldn't be able to distinguish it from a date with an empty day.
          values = values_with_empty_parameters.reject(&:nil?)

          if values.empty?
            send(name + "=", nil)
          else

            value = if Time == klass
                      Time.local(*values)
                    elsif Date == klass
                      begin
                        values = values_with_empty_parameters.collect do |v| v.nil? ? 1 : v end
                        Date.new(*values)
                      rescue ArgumentError => ex # if Date.new raises an exception on an invalid date
                        Time.local(*values).to_date
                      end
                    else
                      klass.new(*values)
                    end

            send(name + "=", value)
          end
        rescue => ex
          raise  Mongoid::Errors::AttributeAssignmentError.new("error on assignment #{values.inspect} to #{name}", ex, name)
          #errors << Mongoid::Errors::AttributeAssignmentError.new("error on assignment #{values.inspect} to #{name}", ex, name)
        end
      end
      unless errors.empty?
        raise Mongoid::Errors::MultiparameterAssignmentErrors.new(errors), "#{errors.size} error(s) on assignment of multiparameter attributes"
      end
    end

    def extract_callstack_for_multiparameter_attributes(pairs)
      attributes = { }

      for pair in pairs
        multiparameter_name, value = pair
        attribute_name = multiparameter_name.split("(").first
        attributes[attribute_name] = [] unless attributes.include?(attribute_name)

        parameter_value = value.empty? ? nil : type_cast_attribute_value(multiparameter_name, value)
        attributes[attribute_name] << [ find_parameter_position(multiparameter_name), parameter_value ]
      end

      attributes.each { |name, values| attributes[name] = values.sort_by{ |v| v.first }.collect { |v| v.last } }
    end

    def type_cast_attribute_value(multiparameter_name, value)
      multiparameter_name =~ /\([0-9]*([if])\)/ ? value.send("to_" + $1) : value
    end

    def find_parameter_position(multiparameter_name)
      multiparameter_name.scan(/\(([0-9]*).*\)/).first.first
    end


    # Read a value from the +Document+ attributes. If the value does not exist
    # it will return nil.
    #
    # Options:
    #
    # name: The name of the attribute to get.
    #
    # Example:
    #
    # <tt>person.read_attribute(:title)</tt>
    def read_attribute(name)
      access = name.to_s
      value = @attributes[access]
      typed_value = fields.has_key?(access) ? fields[access].get(value) : value
      accessed(access, typed_value)
    end

    # Remove a value from the +Document+ attributes. If the value does not exist
    # it will fail gracefully.
    #
    # Options:
    #
    # name: The name of the attribute to remove.
    #
    # Example:
    #
    # <tt>person.remove_attribute(:title)</tt>
    def remove_attribute(name)
      access = name.to_s
      modify(access, @attributes.delete(name.to_s), nil)
    end

    # Returns true when attribute is present.
    #
    # Options:
    #
    # name: The name of the attribute to request presence on.
    def attribute_present?(name)
      value = read_attribute(name)
      !value.blank?
    end

    # Returns the object type. This corresponds to the name of the class that
    # this +Document+ is, which is used in determining the class to
    # instantiate in various cases.
    def _type
      @attributes["_type"]
    end

    # Set the type of the +Document+. This should be the name of the class.
    def _type=(new_type)
      @attributes["_type"] = new_type
    end

    # Write a single attribute to the +Document+ attribute +Hash+. This will
    # also fire the before and after update callbacks, and perform any
    # necessary typecasting.
    #
    # Options:
    #
    # name: The name of the attribute to update.
    # value: The value to set for the attribute.
    #
    # Example:
    #
    # <tt>person.write_attribute(:title, "Mr.")</tt>
    #
    # This will also cause the observing +Document+ to notify it's parent if
    # there is any.
    def write_attribute(name, value)
      access = name.to_s
      typed_value = fields.has_key?(access) ? fields[access].set(value) : value
      modify(access, @attributes[access], typed_value)
      notify if !id.blank? && new_record?
    end

    # Writes the supplied attributes +Hash+ to the +Document+. This will only
    # overwrite existing attributes if they are present in the new +Hash+, all
    # others will be preserved.
    #
    # Options:
    #
    # attrs: The +Hash+ of new attributes to set on the +Document+
    #
    # Example:
    #
    # <tt>person.write_attributes(:title => "Mr.")</tt>
    #
    # This will also cause the observing +Document+ to notify it's parent if
    # there is any.
    def write_attributes(attrs = nil)
      process(attrs || {})
      identified = !id.blank?
      if new_record? && !identified
        identify; notify
      end
    end
    alias :attributes= :write_attributes

    protected
    # apply default values to attributes - calling procs as required
    def default_attributes
      default_values = defaults
      default_values.each_pair do |key, val|
        default_values[key] = val.call if val.respond_to?(:call)
      end
      default_values || {}
    end

    # Return true if dynamic field setting is enabled.
    def set_allowed?(key)
      Mongoid.allow_dynamic_fields && !respond_to?("#{key}=")
    end

    # Used when supplying a :reject_if block as an option to
    # accepts_nested_attributes_for
    def reject(attributes, options)
      rejector = options[:reject_if]
      if rejector
        attributes.delete_if do |key, value|
          rejector.call(value)
        end
      end
    end

    # Used when supplying a :limit as an option to accepts_nested_attributes_for
    def limit(attributes, name, options)
      if options[:limit] && attributes.size > options[:limit]
        raise Mongoid::Errors::TooManyNestedAttributeRecords.new(name, options[:limit])
      end
    end

    # Return true if writing to the given field is allowed
    def write_allowed?(key)
      name = key.to_s
      !self._protected_fields.include?(name)
    end

    module ClassMethods
      # Defines attribute setters for the associations specified by the names.
      # This will work for a has one or has many association.
      #
      # Example:
      #
      #   class Person
      #     include Mongoid::Document
      #     embeds_one :name
      #     embeds_many :addresses
      #
      #     accepts_nested_attributes_for :name, :addresses
      #   end
      def accepts_nested_attributes_for(*args)
        associations = args.flatten
        options = associations.last.is_a?(Hash) ? associations.pop : {}
        associations.each do |name|
          define_method("#{name}_attributes=") do |attrs|
            reject(attrs, options)
            limit(attrs, name, options)
            association = send(name)
            if association
              # observe(association, true)
              association.nested_build(attrs, options)
            else
              send("build_#{name}", attrs, options)
            end
          end
        end
      end

      # Defines fields that cannot be set via mass assignment.
      #
      # Example:
      #
      #   class Person
      #     include Mongoid::Document
      #     field :security_code
      #     attr_protected :security_code
      #   end
      def attr_protected(*names)
        _protected_fields.concat(names.flatten.map(&:to_s))
      end
    end
  end
end
