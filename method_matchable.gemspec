
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "method_matchable/version"

Gem::Specification.new do |spec|
  spec.name          = "method_matchable"
  spec.version       = MethodMatchable::VERSION
  spec.authors       = ["kokuyouwind"]
  spec.email         = ["kokuyouwind@gmail.com"]

  spec.summary       = %q{Enable methods matching in hash pattern}
  spec.description   = %q{Enable methods matching in hash pattern}
  spec.homepage      = "https://github.com/kokuyouwind/method_matchable"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
