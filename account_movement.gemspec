require_relative 'lib/account_movement/version'

Gem::Specification.new do |spec|
  spec.name          = "account_movement"
  spec.version       = AccountMovement::VERSION
  spec.authors       = ["Thomas Almeida"]
  spec.email         = ["thomas.fa@gmail.com"]

  spec.summary       = %q{A account movement parser and financial report generator.}
  spec.description   = %q{A account movement parser .}
  spec.homepage      = "https://www.github.com/thomasalmeida/account_movement"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.github.com/thomasalmeida/account_movement"
  spec.metadata["changelog_uri"] = "https://www.github.com/thomasalmeida/account_movement"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
