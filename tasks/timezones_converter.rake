# encoding: utf-8
# frozen_string_literal: true
desc "DEVELOPMENT ONLY !!! (Requests ruby >= 2.4.0"             \
     "Creates two csv files for later import into sqlite db. "  \
     "Original file can been downloaded by following link: "    \
     "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity_CSV/GeoLiteCity-latest.tar.xz"
# Note for csv to sqlite.db converting 'DB Browser for SQLite' was used.
task :prepare_for_import_to_db do
  require 'csv'
  require 'nearest_time_zone' # TODO remove dependency with original csv database
  require 'timezone'

  origin_csv = File.join(__dir__, '..', 'tmp', 'worldcitiespop.txt')
  timezone_mapping = Hash.new

  zones = Timezone.names.sort_by &:to_s
  zones.each_with_index { |zone, index| timezone_mapping[zone] = index }

  list = []
  CSV.foreach(origin_csv, encoding: 'iso-8859-1:utf-8', headers: true,
              liberal_parsing: true) do |row|

    city_name  = row.fetch("City")
    country    = row.fetch("Country")
    lat        = row.fetch("Latitude").to_f.round(3)
    lng        = row.fetch("Longitude").to_f.round(3)
    population = row.fetch("Population").to_i
    timezone   = NearestTimeZone.to(lat, lng)

    list << [ city_name, country, lat, lng,
              population, timezone_mapping[timezone] ]
  end

  path_to_mapping = File.join(__dir__, '..', 'tmp', 'timezones.csv')
  CSV.open(path_to_mapping , "wb") do |csv|
    csv << ["timezone", "code"]
    timezone_mapping.each_pair { |key, value| csv << [key, value] }
  end

  path_to_new_csv = File.join(__dir__, '..', 'tmp', 'cities.csv')
  CSV.open(path_to_new_csv, "wb") do |csv|
    csv << ["city", "country", "latitude", "longitude", "population", "timezone_code"]
    list.each { |row| csv << row }
  end
end
