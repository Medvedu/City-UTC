# encoding: utf-8
# frozen_string_literal: true
module CityUTC
  module Sqlite
    def self.connect_to_db # no-doc
      path_to_database =
        File.join(__dir__, '..', 'database', 'sqlite.db')

      Sequel.connect "sqlite://#{path_to_database}"
    end
    private_class_method :connect_to_db

    connect_to_db
  end # module Sqlite
end # module CityUTC
