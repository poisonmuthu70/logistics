# -*- encoding: utf-8 -*-
# stub: geocodio 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "geocodio".freeze
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Celis".freeze]
  s.date = "2018-02-16"
  s.description = "Geocodio is a geocoding service that aims to fill a void in the community by allowing developers to geocode large amounts of addresses without worrying about daily limits and high costs.".freeze
  s.email = ["me@davidcel.is".freeze]
  s.homepage = "https://github.com/davidcelis/geocodio".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "An unofficial Ruby client library for geocod.io".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
    else
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
  end
end
