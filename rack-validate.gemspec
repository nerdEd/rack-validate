# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rack-validate}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ed Schmalzle"]
  s.date = %q{2010-10-25}
  s.description = %q{Rack middleware that validates HTML with w3c validator and displays result in page.}
  s.email = %q{Jonas714@gmail.com}
  s.executables = ["autospec", "rackup", "spec"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/autospec",
     "bin/rackup",
     "bin/spec",
     "lib/rack-validate.rb",
     "lib/rack-validate/response_file.rb",
     "lib/rack-validate/validator.rb",
     "rack-validate.gemspec",
     "spec/fixtures/long_response.html",
     "spec/response_file_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/validator_spec.rb",
     "vendor/gems/ruby/1.8/cache/rack-1.1.0.gem",
     "vendor/gems/ruby/1.8/cache/rspec-1.3.0.gem",
     "vendor/gems/ruby/1.8/cache/w3c_validators-1.0.2.gem"
  ]
  s.homepage = %q{http://github.com/nerdEd/rack-validate}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Rack middleware that validates HTML with w3c validator and displays result in page.}
  s.test_files = [
    "spec/response_file_spec.rb",
     "spec/spec_helper.rb",
     "spec/validator_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<w3c_validators>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<w3c_validators>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<w3c_validators>, [">= 0"])
  end
end

