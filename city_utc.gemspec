# encoding: utf-8
Gem::Specification.new do |s|
  s.name          = 'city_utc'
  s.version       = '1.0.5'
  s.date          = '2017-01-13'
  s.authors       = 'Kuzichev Michael'
  s.license       = 'MIT'
  s.email         = 'kMedvedu@gmail.com'
  s.homepage      = 'https://github.com/Medvedu/City-UTC'

  s.files         = Dir['README.md', 'Gemfile', 'Rakefile', 'LICENSE',
                        'server/**/*', 'sources/**/*', 'tasks/**/*']
  s.files.reject! { |filepath| File.basename(filepath).eql? "sqlite.db" }

  s.test_files    = Dir['spec/**/*.rb']
  s.require_paths = ['sources']

  s.summary = [
    "This project consist of two parts\n",

    "First part includes sqlite database with two tables based on",
    "worldcitiespop.csv (http://download.maxmind.com/download/):",
    "cities(city, country, latitude, longitude, population, timezone_code);",
    "timezones(timezone, code).",

    "Second part is sinatra (web) application for work with the database throw Sequel ORM."
  ].join(' ')

  s.required_ruby_version = '>= 2.1' # tested only on ruby 2.4

  ### WEB-SERVER
  s.add_dependency 'thin',              '~> 1.7', '>= 1.7.0'

  ### REST API FRAMEWORK
  s.add_dependency 'sinatra',           '~> 1.4', '>= 1.4.7'

  ### SQLITE ENGINE
  s.add_dependency 'sqlite3',           '~> 1.3', '>= 1.3.13'

  ### DATABASE TOOLKIT (+ORM)
  s.add_dependency 'sequel',            '~> 4.42', '>= 4.42.1'

  ### OTHER DEPENDENCIES
  s.add_dependency 'timezone',          '~> 1.0'
end
