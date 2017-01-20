# City-UTC (database + server)
## Description

Simple UTC Server (Yet another geocode solution, based on sqlite database)

## Installation

```bash
  $ bundle install
  $ bundle exec restore_database! 
```

## Usage

### Database usage example 

```ruby
  cities = CityUTC::City # Sequel::Model

  puts cities.count
  puts cities.select(:city, :population)
             .reverse(:population)
             .limit(3)
             .to_a
```

### Web application usage example

```bash
  $ bundle exec rake launch_web_server!
  $ curl 'http://localhost:30042/time?'
  $ curl 'http://localhost:30042/time?Moscow,New%20York,vladivostok,berlin,wrong_city,washington,ufa'
```

## Requirements

  * Ruby 2.1.0
  * gzip
  * sqlite3,  ~> 1.3.13
  * sequel,   ~> 4.42.1
  * thin      ~> 1.7.0
  * sinatra,  ~> 1.4.7
  * timezone  ~> 1.0

## License

Released under the MIT License. See the [LICENSE](./LICENSE) file for further details.
