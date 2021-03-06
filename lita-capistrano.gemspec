Gem::Specification.new do |spec|
  spec.name          = "lita-capistrano"
  spec.version       = "0.2.0"
  spec.authors       = ["Alexandre Gomes"]
  spec.email         = ["alejdg@outlook.com.br"]
  spec.summary       = "A Lita handler to integrate with Capistrano.rb"
  spec.description   = "A Lita handler to integrate with Capistrano.rb"
  spec.homepage      = "https://github.com/alejdg/lita-capistrano.git"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", " ~> 4.6"
  spec.add_runtime_dependency 'lita-deploy-tracker'
  spec.add_runtime_dependency 'net-ssh'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", "~> 3.0"
end
