
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Rdownloader/version"

Gem::Specification.new do |spec|
  spec.name          = "Rdownloader"
  spec.version       = Rdownloader::VERSION
  spec.authors       = ["yukiraicom"]
  spec.email         = ["yuukiarai19970524@gmail.com"]
  spec.summary       = %q{Rdownloader is a download library for Ruby.}
  spec.description   = %q{Rdownloader...}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  # gem.add_runtime_dependency 'open-uri'
  # gem.add_runtime_dependency "uri"
  # gem.add_runtime_dependency 'pry'
  # gem.add_runtime_dependency 'net/http'
  spec.add_runtime_dependency 'ruby-progressbar',   ["~> 1.9.0"]
  # gem.add_runtime_dependency 'securerandom'
end
