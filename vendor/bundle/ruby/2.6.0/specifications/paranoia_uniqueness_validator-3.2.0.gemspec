# -*- encoding: utf-8 -*-
# stub: paranoia_uniqueness_validator 3.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "paranoia_uniqueness_validator".freeze
  s.version = "3.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Anthony Smith".freeze]
  s.date = "2020-02-08"
  s.description = "Adds the validates_uniqueness_without_deleted validator to ignore deleted fields when validating for uniqueness.".freeze
  s.email = ["anthony@sticksnleaves.com".freeze]
  s.homepage = "https://github.com/anthonator/paranoia_uniqueness_validator".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Validate unique fields without letting those pesky deleted records get in the way. Great for use with Paranoia.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 5.1.0", "< 6.1"])
      s.add_development_dependency(%q<paranoia>.freeze, ["~> 2.3"])
      s.add_development_dependency(%q<database_cleaner>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.6"])
    else
      s.add_dependency(%q<activerecord>.freeze, [">= 5.1.0", "< 6.1"])
      s.add_dependency(%q<paranoia>.freeze, ["~> 2.3"])
      s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.6"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 5.1.0", "< 6.1"])
    s.add_dependency(%q<paranoia>.freeze, ["~> 2.3"])
    s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.6"])
  end
end
