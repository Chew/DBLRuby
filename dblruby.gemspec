Gem::Specification.new do |s|
  s.name = 'dblruby'
  s.version = '1.2.0'
  s.date = '2020-06-19'
  s.summary = 'Top.gg / Discord Bot List API for Ruby'
  s.description = 'A Ruby library for the Top.gg (https://top.gg) API.'
  s.authors = ['Chew']
  s.email = 'chew@chew.pw'
  s.files = Dir['lib/**/*.rb']
  s.homepage = 'https://github.com/Chew/DBLRuby'
  s.license = 'MIT'
  s.add_runtime_dependency 'json', '>= 2.0.0'
  s.add_runtime_dependency 'rest-client', '~> 2.1.0.rc1'
  s.required_ruby_version = '>= 2.2.4'

  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/Chew/DBLRuby/issues',
    'changelog_uri' => 'https://github.com/Chew/DBLRuby/releases',
    'homepage_uri' => 'http://github.com/Chew/DBLRuby',
    'source_code_uri' => 'http://github.com/Chew/DBLRuby',
    'wiki_uri' => 'http://github.com/Chew/DBLRuby/wiki',
    'documentation_uri' => 'https://rubydocs.chew.pro/docs/dblruby'
  }
end
