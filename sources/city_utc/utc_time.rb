# encoding: utf-8
# frozen_string_literal: true
module CityUTC
  module UTC_Time # no-doc

    ##
    # Returns UTC time for +city_name+.
    #
    # @param [String] city_name
    #
    # @return [String]
    #   Pretty formatted Universal Time (UTC) for recognized city.
    #   when city unrecognized it returns 'UNKNOWN'.

    def self.for_city(city_name)
      time_zone = City.timezone_for_biggest(city_name)

      if (tz = ::Timezone[time_zone]).is_a? ::Timezone::NilZone
        return "UNKNOWN"
      else
        utc_time = tz.utc_to_local(Time.now)

        return UTC_Time.pretty_formatted(utc_time, city_name)
      end
    end

    ##
    # Presents time instance as pretty formatted string.
    #
    # @example
    #   time # ==> 2017-01-13 12:37:34 UTC
    #   formatted(time) # ==> "UTC: 2017-01-13 12:37:34"
    #
    # @param [Time] time
    #
    # @param [String] prefix
    #   Overrides +UTC+ prefix when used.
    #
    # @return [String]

    def self.pretty_formatted(time, prefix = nil)
      time = time.utc unless time.utc?

      if prefix
        return time.strftime "#{prefix}: %Y-%m-%d %H:%M:%S"
      else
        return time.strftime "%Z: %Y-%m-%d %H:%M:%S"
      end
    end
  end # module UTC_Time
end # module CityUTC
