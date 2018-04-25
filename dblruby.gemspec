Gem::Specification.new do |s|
  s.name = 'dblruby'
  s.version = '0.5.0'
  s.date = '2018-04-23'
  s.summary = 'A Discord bot list ruby library.'
  s.description = 'A ruby library made for the Discord Bot List.'
  s.authors = ['Chewsterchew']
  s.email = 'chew@chew.pw'
  s.files = Dir['lib/**/*.rb']
  s.homepage = 'http://github.com/Chewsterchew/DBLRuby'
  s.license = 'MIT'
  s.add_runtime_dependency 'rest-client', '~> 2.1.0.rc1'
end
