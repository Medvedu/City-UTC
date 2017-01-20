# encoding: utf-8
require 'webmock/rspec'

require_relative '../sources/city_utc'

RSpec.configure do |config|
  # Internet connection locked, localhost connections still allowed
  WebMock.disable_net_connect! allow_localhost: true
end
