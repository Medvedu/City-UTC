# encoding: utf-8
require 'spec_helper'

describe "As database" do
  it 'it creates valid Sequel::Model relation for Cities table' do
    cities = CityUTC::City

    expect(cities.count).to be > 0
    expect(cities.select(:city, :population)
                 .reverse(:population)
                 .limit(3)
                 .to_a.collect(&:city)
    ).to contain_exactly "tokyo", "shanghai", "bombay"
  end
end # describe "As database"
