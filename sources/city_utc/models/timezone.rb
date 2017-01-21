# encoding: utf-8
# frozen_string_literal: true
module CityUTC
  # == Schema for `timezones` table
  #
  #   CREATE TABLE `timezones` (
  # 	  `timezone`	TEXT,
  # 	  `code`	INTEGER,
  # 	  PRIMARY KEY(`code`)
  #   );
  class Timezone < Sequel::Model
  end # class Timezone
end # module CityUTC
