# encoding: utf-8
# frozen_string_literal: true
module CityUTC
  class City < Sequel::Model

    ##
    # Returns timezone for city.
    #
    # When more than one city was found it returns timezone for city with
    # biggest population.
    #
    # @param [String] city_name
    #
    # @return [String]
    #   Returns +"NilZone"+ when nothing was found.

    def self.timezone_for_biggest(city_name)
      tz = City.select(:timezone)
               .where(city: city_name.downcase)
               .reverse(:population)
               .limit(1)
               .join(:timezones, code: :timezone_code)
               .first

      tz ? tz[:timezone] : "NilZone"
    end
  end # class City
end # module CityUTC
