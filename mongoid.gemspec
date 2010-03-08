# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mongoid}
  s.version = "1.2.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Durran Jordan"]
  s.date = %q{2010-03-05}
  s.email = %q{durran@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     ".watchr",
     "HISTORY",
     "MIT_LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "caliper.yml",
     "lib/mongoid.rb",
     "lib/mongoid/associations.rb",
     "lib/mongoid/associations/belongs_to.rb",
     "lib/mongoid/associations/belongs_to_related.rb",
     "lib/mongoid/associations/has_many.rb",
     "lib/mongoid/associations/has_many_related.rb",
     "lib/mongoid/associations/has_one.rb",
     "lib/mongoid/associations/has_one_related.rb",
     "lib/mongoid/associations/meta_data.rb",
     "lib/mongoid/associations/options.rb",
     "lib/mongoid/associations/proxy.rb",
     "lib/mongoid/attributes.rb",
     "lib/mongoid/caching.rb",
     "lib/mongoid/callbacks.rb",
     "lib/mongoid/collection.rb",
     "lib/mongoid/collections/cyclic_iterator.rb",
     "lib/mongoid/collections/master.rb",
     "lib/mongoid/collections/mimic.rb",
     "lib/mongoid/collections/operations.rb",
     "lib/mongoid/collections/slaves.rb",
     "lib/mongoid/commands.rb",
     "lib/mongoid/commands/create.rb",
     "lib/mongoid/commands/delete.rb",
     "lib/mongoid/commands/delete_all.rb",
     "lib/mongoid/commands/deletion.rb",
     "lib/mongoid/commands/destroy.rb",
     "lib/mongoid/commands/destroy_all.rb",
     "lib/mongoid/commands/save.rb",
     "lib/mongoid/components.rb",
     "lib/mongoid/config.rb",
     "lib/mongoid/contexts.rb",
     "lib/mongoid/contexts/enumerable.rb",
     "lib/mongoid/contexts/ids.rb",
     "lib/mongoid/contexts/mongo.rb",
     "lib/mongoid/contexts/paging.rb",
     "lib/mongoid/criteria.rb",
     "lib/mongoid/criterion/complex.rb",
     "lib/mongoid/criterion/exclusion.rb",
     "lib/mongoid/criterion/inclusion.rb",
     "lib/mongoid/criterion/optional.rb",
     "lib/mongoid/cursor.rb",
     "lib/mongoid/document.rb",
     "lib/mongoid/enslavement.rb",
     "lib/mongoid/errors.rb",
     "lib/mongoid/extensions.rb",
     "lib/mongoid/extensions/array/accessors.rb",
     "lib/mongoid/extensions/array/aliasing.rb",
     "lib/mongoid/extensions/array/assimilation.rb",
     "lib/mongoid/extensions/array/conversions.rb",
     "lib/mongoid/extensions/array/parentization.rb",
     "lib/mongoid/extensions/boolean/conversions.rb",
     "lib/mongoid/extensions/date/conversions.rb",
     "lib/mongoid/extensions/datetime/conversions.rb",
     "lib/mongoid/extensions/float/conversions.rb",
     "lib/mongoid/extensions/hash/accessors.rb",
     "lib/mongoid/extensions/hash/assimilation.rb",
     "lib/mongoid/extensions/hash/conversions.rb",
     "lib/mongoid/extensions/hash/criteria_helpers.rb",
     "lib/mongoid/extensions/hash/scoping.rb",
     "lib/mongoid/extensions/integer/conversions.rb",
     "lib/mongoid/extensions/nil/assimilation.rb",
     "lib/mongoid/extensions/object/conversions.rb",
     "lib/mongoid/extensions/proc/scoping.rb",
     "lib/mongoid/extensions/string/conversions.rb",
     "lib/mongoid/extensions/string/inflections.rb",
     "lib/mongoid/extensions/symbol/inflections.rb",
     "lib/mongoid/extensions/time/conversions.rb",
     "lib/mongoid/factory.rb",
     "lib/mongoid/field.rb",
     "lib/mongoid/fields.rb",
     "lib/mongoid/finders.rb",
     "lib/mongoid/identity.rb",
     "lib/mongoid/indexes.rb",
     "lib/mongoid/javascript.rb",
     "lib/mongoid/javascript/functions.yml",
     "lib/mongoid/matchers.rb",
     "lib/mongoid/matchers/all.rb",
     "lib/mongoid/matchers/default.rb",
     "lib/mongoid/matchers/exists.rb",
     "lib/mongoid/matchers/gt.rb",
     "lib/mongoid/matchers/gte.rb",
     "lib/mongoid/matchers/in.rb",
     "lib/mongoid/matchers/lt.rb",
     "lib/mongoid/matchers/lte.rb",
     "lib/mongoid/matchers/ne.rb",
     "lib/mongoid/matchers/nin.rb",
     "lib/mongoid/matchers/size.rb",
     "lib/mongoid/memoization.rb",
     "lib/mongoid/named_scope.rb",
     "lib/mongoid/scope.rb",
     "lib/mongoid/timestamps.rb",
     "lib/mongoid/versioning.rb",
     "mongoid.gemspec",
     "perf/benchmark.rb",
     "spec/integration/mongoid/associations_spec.rb",
     "spec/integration/mongoid/attributes_spec.rb",
     "spec/integration/mongoid/commands_spec.rb",
     "spec/integration/mongoid/contexts/enumerable_spec.rb",
     "spec/integration/mongoid/criteria_spec.rb",
     "spec/integration/mongoid/document_spec.rb",
     "spec/integration/mongoid/extensions_spec.rb",
     "spec/integration/mongoid/finders_spec.rb",
     "spec/integration/mongoid/inheritance_spec.rb",
     "spec/integration/mongoid/named_scope_spec.rb",
     "spec/models/address.rb",
     "spec/models/animal.rb",
     "spec/models/comment.rb",
     "spec/models/country_code.rb",
     "spec/models/employer.rb",
     "spec/models/game.rb",
     "spec/models/inheritance.rb",
     "spec/models/location.rb",
     "spec/models/mixed_drink.rb",
     "spec/models/name.rb",
     "spec/models/namespacing.rb",
     "spec/models/patient.rb",
     "spec/models/person.rb",
     "spec/models/pet.rb",
     "spec/models/pet_owner.rb",
     "spec/models/phone.rb",
     "spec/models/post.rb",
     "spec/models/translation.rb",
     "spec/models/vet_visit.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/unit/mongoid/associations/belongs_to_related_spec.rb",
     "spec/unit/mongoid/associations/belongs_to_spec.rb",
     "spec/unit/mongoid/associations/has_many_related_spec.rb",
     "spec/unit/mongoid/associations/has_many_spec.rb",
     "spec/unit/mongoid/associations/has_one_related_spec.rb",
     "spec/unit/mongoid/associations/has_one_spec.rb",
     "spec/unit/mongoid/associations/meta_data_spec.rb",
     "spec/unit/mongoid/associations/options_spec.rb",
     "spec/unit/mongoid/associations_spec.rb",
     "spec/unit/mongoid/attributes_spec.rb",
     "spec/unit/mongoid/caching_spec.rb",
     "spec/unit/mongoid/callbacks_spec.rb",
     "spec/unit/mongoid/collection_spec.rb",
     "spec/unit/mongoid/collections/cyclic_iterator_spec.rb",
     "spec/unit/mongoid/collections/master_spec.rb",
     "spec/unit/mongoid/collections/mimic_spec.rb",
     "spec/unit/mongoid/collections/slaves_spec.rb",
     "spec/unit/mongoid/commands/create_spec.rb",
     "spec/unit/mongoid/commands/delete_all_spec.rb",
     "spec/unit/mongoid/commands/delete_spec.rb",
     "spec/unit/mongoid/commands/destroy_all_spec.rb",
     "spec/unit/mongoid/commands/destroy_spec.rb",
     "spec/unit/mongoid/commands/save_spec.rb",
     "spec/unit/mongoid/commands_spec.rb",
     "spec/unit/mongoid/config_spec.rb",
     "spec/unit/mongoid/contexts/enumerable_spec.rb",
     "spec/unit/mongoid/contexts/mongo_spec.rb",
     "spec/unit/mongoid/contexts_spec.rb",
     "spec/unit/mongoid/criteria_spec.rb",
     "spec/unit/mongoid/criterion/complex_spec.rb",
     "spec/unit/mongoid/criterion/exclusion_spec.rb",
     "spec/unit/mongoid/criterion/inclusion_spec.rb",
     "spec/unit/mongoid/criterion/optional_spec.rb",
     "spec/unit/mongoid/cursor_spec.rb",
     "spec/unit/mongoid/document_spec.rb",
     "spec/unit/mongoid/enslavement_spec.rb",
     "spec/unit/mongoid/errors_spec.rb",
     "spec/unit/mongoid/extensions/array/accessors_spec.rb",
     "spec/unit/mongoid/extensions/array/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/array/conversions_spec.rb",
     "spec/unit/mongoid/extensions/array/parentization_spec.rb",
     "spec/unit/mongoid/extensions/boolean/conversions_spec.rb",
     "spec/unit/mongoid/extensions/date/conversions_spec.rb",
     "spec/unit/mongoid/extensions/datetime/conversions_spec.rb",
     "spec/unit/mongoid/extensions/float/conversions_spec.rb",
     "spec/unit/mongoid/extensions/hash/accessors_spec.rb",
     "spec/unit/mongoid/extensions/hash/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/hash/conversions_spec.rb",
     "spec/unit/mongoid/extensions/hash/criteria_helpers_spec.rb",
     "spec/unit/mongoid/extensions/hash/scoping_spec.rb",
     "spec/unit/mongoid/extensions/integer/conversions_spec.rb",
     "spec/unit/mongoid/extensions/nil/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/object/conversions_spec.rb",
     "spec/unit/mongoid/extensions/proc/scoping_spec.rb",
     "spec/unit/mongoid/extensions/string/conversions_spec.rb",
     "spec/unit/mongoid/extensions/string/inflections_spec.rb",
     "spec/unit/mongoid/extensions/symbol/inflections_spec.rb",
     "spec/unit/mongoid/extensions/time/conversions_spec.rb",
     "spec/unit/mongoid/factory_spec.rb",
     "spec/unit/mongoid/field_spec.rb",
     "spec/unit/mongoid/fields_spec.rb",
     "spec/unit/mongoid/finders_spec.rb",
     "spec/unit/mongoid/identity_spec.rb",
     "spec/unit/mongoid/indexes_spec.rb",
     "spec/unit/mongoid/javascript_spec.rb",
     "spec/unit/mongoid/matchers/all_spec.rb",
     "spec/unit/mongoid/matchers/default_spec.rb",
     "spec/unit/mongoid/matchers/exists_spec.rb",
     "spec/unit/mongoid/matchers/gt_spec.rb",
     "spec/unit/mongoid/matchers/gte_spec.rb",
     "spec/unit/mongoid/matchers/in_spec.rb",
     "spec/unit/mongoid/matchers/lt_spec.rb",
     "spec/unit/mongoid/matchers/lte_spec.rb",
     "spec/unit/mongoid/matchers/ne_spec.rb",
     "spec/unit/mongoid/matchers/nin_spec.rb",
     "spec/unit/mongoid/matchers/size_spec.rb",
     "spec/unit/mongoid/matchers_spec.rb",
     "spec/unit/mongoid/memoization_spec.rb",
     "spec/unit/mongoid/named_scope_spec.rb",
     "spec/unit/mongoid/scope_spec.rb",
     "spec/unit/mongoid/timestamps_spec.rb",
     "spec/unit/mongoid/versioning_spec.rb",
     "spec/unit/mongoid_spec.rb"
  ]
  s.homepage = %q{http://mongoid.org}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{ODM framework for MongoDB}
  s.test_files = [
    "spec/integration/mongoid/associations_spec.rb",
     "spec/integration/mongoid/attributes_spec.rb",
     "spec/integration/mongoid/commands_spec.rb",
     "spec/integration/mongoid/contexts/enumerable_spec.rb",
     "spec/integration/mongoid/criteria_spec.rb",
     "spec/integration/mongoid/document_spec.rb",
     "spec/integration/mongoid/extensions_spec.rb",
     "spec/integration/mongoid/finders_spec.rb",
     "spec/integration/mongoid/inheritance_spec.rb",
     "spec/integration/mongoid/named_scope_spec.rb",
     "spec/models/address.rb",
     "spec/models/animal.rb",
     "spec/models/comment.rb",
     "spec/models/country_code.rb",
     "spec/models/employer.rb",
     "spec/models/game.rb",
     "spec/models/inheritance.rb",
     "spec/models/location.rb",
     "spec/models/mixed_drink.rb",
     "spec/models/name.rb",
     "spec/models/namespacing.rb",
     "spec/models/patient.rb",
     "spec/models/person.rb",
     "spec/models/pet.rb",
     "spec/models/pet_owner.rb",
     "spec/models/phone.rb",
     "spec/models/post.rb",
     "spec/models/translation.rb",
     "spec/models/vet_visit.rb",
     "spec/spec_helper.rb",
     "spec/unit/mongoid/associations/belongs_to_related_spec.rb",
     "spec/unit/mongoid/associations/belongs_to_spec.rb",
     "spec/unit/mongoid/associations/has_many_related_spec.rb",
     "spec/unit/mongoid/associations/has_many_spec.rb",
     "spec/unit/mongoid/associations/has_one_related_spec.rb",
     "spec/unit/mongoid/associations/has_one_spec.rb",
     "spec/unit/mongoid/associations/meta_data_spec.rb",
     "spec/unit/mongoid/associations/options_spec.rb",
     "spec/unit/mongoid/associations_spec.rb",
     "spec/unit/mongoid/attributes_spec.rb",
     "spec/unit/mongoid/caching_spec.rb",
     "spec/unit/mongoid/callbacks_spec.rb",
     "spec/unit/mongoid/collection_spec.rb",
     "spec/unit/mongoid/collections/cyclic_iterator_spec.rb",
     "spec/unit/mongoid/collections/master_spec.rb",
     "spec/unit/mongoid/collections/mimic_spec.rb",
     "spec/unit/mongoid/collections/slaves_spec.rb",
     "spec/unit/mongoid/commands/create_spec.rb",
     "spec/unit/mongoid/commands/delete_all_spec.rb",
     "spec/unit/mongoid/commands/delete_spec.rb",
     "spec/unit/mongoid/commands/destroy_all_spec.rb",
     "spec/unit/mongoid/commands/destroy_spec.rb",
     "spec/unit/mongoid/commands/save_spec.rb",
     "spec/unit/mongoid/commands_spec.rb",
     "spec/unit/mongoid/config_spec.rb",
     "spec/unit/mongoid/contexts/enumerable_spec.rb",
     "spec/unit/mongoid/contexts/mongo_spec.rb",
     "spec/unit/mongoid/contexts_spec.rb",
     "spec/unit/mongoid/criteria_spec.rb",
     "spec/unit/mongoid/criterion/complex_spec.rb",
     "spec/unit/mongoid/criterion/exclusion_spec.rb",
     "spec/unit/mongoid/criterion/inclusion_spec.rb",
     "spec/unit/mongoid/criterion/optional_spec.rb",
     "spec/unit/mongoid/cursor_spec.rb",
     "spec/unit/mongoid/document_spec.rb",
     "spec/unit/mongoid/enslavement_spec.rb",
     "spec/unit/mongoid/errors_spec.rb",
     "spec/unit/mongoid/extensions/array/accessors_spec.rb",
     "spec/unit/mongoid/extensions/array/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/array/conversions_spec.rb",
     "spec/unit/mongoid/extensions/array/parentization_spec.rb",
     "spec/unit/mongoid/extensions/boolean/conversions_spec.rb",
     "spec/unit/mongoid/extensions/date/conversions_spec.rb",
     "spec/unit/mongoid/extensions/datetime/conversions_spec.rb",
     "spec/unit/mongoid/extensions/float/conversions_spec.rb",
     "spec/unit/mongoid/extensions/hash/accessors_spec.rb",
     "spec/unit/mongoid/extensions/hash/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/hash/conversions_spec.rb",
     "spec/unit/mongoid/extensions/hash/criteria_helpers_spec.rb",
     "spec/unit/mongoid/extensions/hash/scoping_spec.rb",
     "spec/unit/mongoid/extensions/integer/conversions_spec.rb",
     "spec/unit/mongoid/extensions/nil/assimilation_spec.rb",
     "spec/unit/mongoid/extensions/object/conversions_spec.rb",
     "spec/unit/mongoid/extensions/proc/scoping_spec.rb",
     "spec/unit/mongoid/extensions/string/conversions_spec.rb",
     "spec/unit/mongoid/extensions/string/inflections_spec.rb",
     "spec/unit/mongoid/extensions/symbol/inflections_spec.rb",
     "spec/unit/mongoid/extensions/time/conversions_spec.rb",
     "spec/unit/mongoid/factory_spec.rb",
     "spec/unit/mongoid/field_spec.rb",
     "spec/unit/mongoid/fields_spec.rb",
     "spec/unit/mongoid/finders_spec.rb",
     "spec/unit/mongoid/identity_spec.rb",
     "spec/unit/mongoid/indexes_spec.rb",
     "spec/unit/mongoid/javascript_spec.rb",
     "spec/unit/mongoid/matchers/all_spec.rb",
     "spec/unit/mongoid/matchers/default_spec.rb",
     "spec/unit/mongoid/matchers/exists_spec.rb",
     "spec/unit/mongoid/matchers/gt_spec.rb",
     "spec/unit/mongoid/matchers/gte_spec.rb",
     "spec/unit/mongoid/matchers/in_spec.rb",
     "spec/unit/mongoid/matchers/lt_spec.rb",
     "spec/unit/mongoid/matchers/lte_spec.rb",
     "spec/unit/mongoid/matchers/ne_spec.rb",
     "spec/unit/mongoid/matchers/nin_spec.rb",
     "spec/unit/mongoid/matchers/size_spec.rb",
     "spec/unit/mongoid/matchers_spec.rb",
     "spec/unit/mongoid/memoization_spec.rb",
     "spec/unit/mongoid/named_scope_spec.rb",
     "spec/unit/mongoid/scope_spec.rb",
     "spec/unit/mongoid/timestamps_spec.rb",
     "spec/unit/mongoid/versioning_spec.rb",
     "spec/unit/mongoid_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["<= 2.3.5"])
      s.add_runtime_dependency(%q<mongo>, [">= 0.18.3"])
      s.add_runtime_dependency(%q<durran-validatable>, [">= 2.0.1"])
      s.add_runtime_dependency(%q<will_paginate>, ["< 2.9"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.8"])
    else
      s.add_dependency(%q<activesupport>, ["<= 2.3.5"])
      s.add_dependency(%q<mongo>, [">= 0.18.3"])
      s.add_dependency(%q<durran-validatable>, [">= 2.0.1"])
      s.add_dependency(%q<will_paginate>, ["< 2.9"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<mocha>, [">= 0.9.8"])
    end
  else
    s.add_dependency(%q<activesupport>, ["<= 2.3.5"])
    s.add_dependency(%q<mongo>, [">= 0.18.3"])
    s.add_dependency(%q<durran-validatable>, [">= 2.0.1"])
    s.add_dependency(%q<will_paginate>, ["< 2.9"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<mocha>, [">= 0.9.8"])
  end
end

