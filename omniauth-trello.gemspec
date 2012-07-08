# charset: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-trello/version"

Gem::Specification.new do |s|
  s.name        = 'omniauth-trello'
  s.version     = OmniAuth::Trello::VERSION
  s.date        = '2012-07-08'
  s.summary     = "Omniauth strategy for trello.com"
  s.description = "Omniauth strategy for trello.com"
  s.authors     = ["Evgeniy Kelyarsky"]
  s.email       = 'kelyar@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'https://github.com/kelyar/omniauth-trello'
  s.require_paths = ["lib"]
end
