require "spec_helper"

describe Mongoid::Associations::ReferencedIn do

  describe ".initialize" do

    context "when related id has been set" do

      before do
        @document = stub(:person_id => "5")
        @options = Mongoid::Associations::Options.new(:name => :person)
        @related = stub
      end

      it "finds the object by id" do
        Person.expects(:find).with(@document.person_id).returns(@related)
        association = Mongoid::Associations::ReferencedIn.new(@document, "5", @options)
        association.should == @related
      end

    end

    context "when options have an extension" do

      before do
        @document = stub(:person_id => "5")
        @block = Proc.new {
          def extension
            "Testing"
          end
        }
        @options = Mongoid::Associations::Options.new(:name => :person, :extend => @block)
        @related = stub
        Person.expects(:find).with(@document.person_id).returns(@related)
        @association = Mongoid::Associations::ReferencedIn.new(@document, "5", @options)
      end

      it "adds the extension module" do
        @association.extension.should == "Testing"
      end

    end

  end

  describe ".instantiate" do

    context "when foreign key is not nil" do

      before do
        @document = stub(:person_id => "5")
        @options = Mongoid::Associations::Options.new(:name => :person)
      end

      it "delegates to new" do
        Mongoid::Associations::ReferencedIn.expects(:new).with(@document, "5", @options, nil)
        Mongoid::Associations::ReferencedIn.instantiate(@document, @options)
      end

    end

    context "when foreign key is nil" do

      before do
        @document = stub(:person_id => nil)
        @options = Mongoid::Associations::Options.new(:name => :person)
      end

      it "returns nil" do
        Mongoid::Associations::ReferencedIn.instantiate(@document, @options).should be_nil
      end

    end

  end

  describe "#method_missing" do

    before do
      @person = Person.new(:title => "Mr")
      @document = stub(:person_id => "5")
      @options = Mongoid::Associations::Options.new(:name => :person)
      Person.expects(:find).with(@document.person_id).returns(@person)
      @association = Mongoid::Associations::ReferencedIn.new(@document, "5", @options)
    end

    context "when getting values" do

      it "delegates to the document" do
        @association.title.should == "Mr"
      end

    end

    context "when setting values" do

      it "delegates to the document" do
        @association.title = "Sir"
        @association.title.should == "Sir"
      end

    end

  end

  describe ".macro" do

    it "returns :referenced_in" do
      Mongoid::Associations::ReferencedIn.macro.should == :referenced_in
    end

  end

  describe ".update" do

    before do
      @related = stub(:id => "5")
      @child = Game.new
      @options = Mongoid::Associations::Options.new(:name => :person)
      @association = Mongoid::Associations::ReferencedIn.update(@related, @child, @options)
    end

    it "sets the related object id on the parent" do
      @child.person_id.should == "5"
    end

    it "returns the proxy" do
      @association.target.should == @related
    end

    context "when target is nil" do

      it "returns nil" do
        Mongoid::Associations::ReferencedIn.update(nil, @child, @options).should be_nil
      end

      it "removes the association" do
        Mongoid::Associations::ReferencedIn.update(nil, @child, @options)
        @child.person.should be_nil
      end
    end

  end

end
