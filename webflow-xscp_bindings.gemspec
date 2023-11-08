require_relative 'lib/webflow/xscp_bindings/version'

Gem::Specification.new do |spec|
  spec.name          = "webflow-xscp_bindings"
  spec.version       = Webflow::XscpBindings::VERSION
  spec.authors       = ["Mike Menne"]
  spec.email         = ["mike@humanagency.com"]

  spec.summary       = %q{Utility for generating Webflow XSCP JSON. }
  spec.description   = %q{Provides a simple utility to convert HTML into Webflow XSCP JSON that can be pasted directly into the Webflow designer.}
  spec.homepage      = "https://github.com/humanagencyorg/webflow-xscp_bindings"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/humanagencyorg/webflow-xscp_bindings"
  spec.metadata["changelog_uri"] = "https://github.com/humanagencyorg/webflow-xscp_bindings"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 6.0"
  spec.add_development_dependency "pry" 
end
