# encoding: utf-8
require 'spec_helper'
require 'net/http'

# To pass this tests launch the server!
# TODO add rspec helper to check server state and launch up when s isn't started
describe "As Web Server." do
  context 'When client sends valid request' do
    it 'returns time' do
      uri = URI('http://127.0.0.1/time?')
      uri.port = 30042

      http = Net::HTTP.start(uri.host, uri.port)
      request = Net::HTTP::Get.new uri
      response = http.request request

      expect(response.body).to match /UTC:\s\d*-\d*-\d* \d*:\d*/
    end

    it 'returns time for each param for request with optional queries' do
      url = 'http://127.0.0.1/time?Moscow,New%20York,vladivostok,' \
            'berlin,washington,ufa'

      uri = URI(url)
      uri.port = 30042

      http = Net::HTTP.start(uri.host, uri.port)
      request = Net::HTTP::Get.new uri
      response = http.request request

      (response.body).split("\n").each do |line|
        expect(line).to match /\w*:\s\d*-\d*-\d* \d*:\d*/
      end
    end

    it 'returns an +UNKNOWN+ for city with unknown coordinates' do
      uri = URI('http://127.0.0.1/time?this_this_never_exists')
      uri.port = 30042

      http = Net::HTTP.start(uri.host, uri.port)
      request = Net::HTTP::Get.new uri
      response = http.request request

      expect(response.body).to match /UNKNOWN/
    end
  end # context 'valid request'

  # ----------------------------------------------------

  context 'When client sends invalid request' do
    it 'returns an error message' do
      uri = URI('http://127.0.0.1/smdfasf?')
      uri.port = 30042

      http = Net::HTTP.start(uri.host, uri.port)
      request = Net::HTTP::Get.new uri
      response = http.request request

      expect(response.body)
        .to match /Please use get http request for 'time' api endpoint/
    end
  end # context 'invalid request'
end # describe "As Web Server. When client sends"
