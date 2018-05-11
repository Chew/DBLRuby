Gem::Specification.new do |s|
  s.name = 'dblruby'
  s.version = '0.7.0'
  s.date = '2018-05-10'
  s.summary = 'Discord Bot List API for Ruby'
  s.description = 'A Ruby library for the Discord Bot List (https://discordbots.org) API.'
  s.authors = ['Chewsterchew']
  s.email = 'chew@chew.pw'
  s.files = Dir['lib/**/*.rb']
  s.homepage = 'http://github.com/Chewsterchew/DBLRuby'
  s.license = 'MIT'
  s.add_runtime_dependency 'rest-client', '~> 2.1.0.rc1'
  s.required_ruby_version = '>= 2.2.4'

  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/Chewsterchew/DBLRuby/issues',
    'changelog_uri'   => 'https://github.com/Chewsterchew/DBLRuby/releases',
    'homepage_uri'    => 'http://github.com/Chewsterchew/DBLRuby',
    'source_code_uri' => 'http://github.com/Chewsterchew/DBLRuby',
    'wiki_uri'        => 'http://github.com/Chewsterchew/DBLRuby/wiki'
  }
end
