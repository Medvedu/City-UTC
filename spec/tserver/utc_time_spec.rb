# encoding: utf-8
require 'spec_helper'

module CityUTC
  describe UTC_Time do
    before :each do
      local_time = Time.new(2015,04,11,13,30,50,"+03:00")
      allow(Time).to receive(:now).and_return local_time
    end

    context '#for_city' do
      it "returns +'UNKNOWN'+ when +:local_location+ unrecognized" do
        expect(described_class.for_city('there_is_no_city_with_dat_name'))
          .to be_eql "UNKNOWN"
      end

      # https://www.timeanddate.com/worldclock/converted.html?iso=20011129T1430&p1=179&p2=4305
      it 'returns valid UTC time for New York' do
        # Note: New York (US) UTC is -5, so it should be eql 05:30:50 UTC
        #
        # But Timezone gem so sweety it holds daylights (+/- 1 hour) time changes
        # for us. Real New York UTC Time is 06:30:50.
        expect(described_class.for_city('New York').to_s)
          .to be_eql("New York: 2015-04-11 06:30:50")
      end

      it 'returns valid UTC time for Ufa' do
        # UTC +05:00 from 10:30:50 UTC
        expect(described_class.for_city('Ufa').to_s)
          .to be_eql("Ufa: 2015-04-11 15:30:50")
      end
    end # context '#for_city'

    # ----------------------------------------------------

    context '#pretty_formatted' do
      it 'presents time as expected(formatted string)' do
        expect(described_class.pretty_formatted(Time.now.utc))
          .to be_eql("UTC: 2015-04-11 10:30:50")
      end

      it 'overrides utc prefix when +location+ param is used' do
        expect(described_class.pretty_formatted(Time.now.utc, "PREFIX"))
          .to be_eql("PREFIX: 2015-04-11 10:30:50")
      end
    end # context '#pretty_formatted'
  end # describe CityUTC
end # module CityUTC
