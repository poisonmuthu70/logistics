# -*- encoding: utf-8 -*-
# stub: jqgrid_for_rails 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "jqgrid_for_rails".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Juan Manuel Cuello".freeze]
  s.date = "2013-03-27"
  s.description = "Simple solution to create jqgrids easily using Rails".freeze
  s.email = "juanmacuello@gmail.com".freeze
  s.homepage = "http://github.com/Juanmcuello/jqgrid_for_rails".freeze
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Simple solution to create jqgrids easily using Rails".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<will_paginate>.freeze, [">= 0"])
    else
      s.add_dependency(%q<will_paginate>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<will_paginate>.freeze, [">= 0"])
  end
end
