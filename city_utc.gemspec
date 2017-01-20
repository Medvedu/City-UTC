# encoding: utf-8
Gem::Specification.new do |s|
  s.name          = 'city_utc'
  s.version       = '1.0.0'
  s.date          = '2017-01-13'
  s.authors       = 'Kuzichev Michael'
  s.license       = 'MIT'
  s.email         = 'kMedvedu@gmail.com'

  s.files         = Dir['README.md', 'Gemfile', 'Rakefile', 'LICENSE',
                        'server/**/*', 'sources/**/*', 'tasks/**/*']

  s.test_files    = Dir['spec/**/*.rb']
  s.require_paths = ['sources']

  s.summary = 'Simple UTC Server (Yet another geocode solution, based on sqlite database)'

  # tested only on ruby 2.4
  s.required_ruby_version = '>= 2.1'

  ### WEB-SERVER
  s.add_dependency 'thin',              '~> 1.7.0'

  ### REST API FRAMEWORK
  s.add_dependency 'sinatra',           '~> 1.4.7'

  ### SQLITE ENGINE
  s.add_dependency 'sqlite3',           '~> 1.3.13'

  ### DATABASE TOOLKIT (+ORM)
  s.add_dependency 'sequel',            '~> 4.42.1'

  ### OTHER DEPENDENCIES
  s.add_dependency 'timezone',          '~> 1.0'
end
