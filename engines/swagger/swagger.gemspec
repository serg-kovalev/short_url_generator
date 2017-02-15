$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "swagger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "swagger"
  s.version     = Swagger::VERSION
  s.authors     = ["serg-kovalev"]
  s.email       = [""]
  s.homepage    = "https://github.com/serg-kovalev"
  s.summary     = "Summary of Swagger."
  s.description = "Description of Swagger."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails"

  # s.add_development_dependency "sqlite3"
end
