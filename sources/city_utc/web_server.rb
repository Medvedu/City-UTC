# encoding: utf-8
# frozen_string_literal: true
module CityUTC
  class WebServer < Sinatra::Base # no-doc
    get "/time" do # no-doc
      plain_text = CityUTC::UTC_Time.pretty_formatted(Time.now)

      cities =
        if request.params.empty?
          []
        else
          request.params.keys.first.split(',')
        end

      cities.each { |city| plain_text += "\n#{UTC_Time.for_city(city)}" }

      body plain_text
      status 200 # OK
    end

    get /.*/ do # no-doc
      plain_text =
        "Please use get http request for 'time' api endpoint," \
        " examples: '/time?Moscow,New%20York', '/time', '/time?Pskov' and so on."

      body plain_text
      status 400 # Bad request
    end
  end # class WebServer
end # module CityUTC
