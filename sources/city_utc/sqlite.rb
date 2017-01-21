# encoding: utf-8
# frozen_string_literal: true
module CityUTC
  module Sqlite

    def self.restore_database # no-doc
      path_to_folder = File.join(__dir__, "..", "database")
      path_to_archive = File.join(path_to_folder, 'sqlite.db.gz')

      `gzip -d #{path_to_archive}`
    end
    private_class_method :restore_database

    def self.restorable?  # no-doc
      path_to_archive  = File.join(__dir__, '..', 'database', 'sqlite.db.gz')
      path_to_database = File.join(__dir__, '..', 'database', 'sqlite.db')

      File.exist?(path_to_archive) && !File.exist?(path_to_database)
    end
    private_class_method :restorable?

    def self.connect_to_db # no-doc
      path_to_database = File.join(__dir__, '..', 'database', 'sqlite.db')

      Sequel.connect "sqlite://#{path_to_database}"
    end
    private_class_method :connect_to_db

    restore_database if restorable?
    connect_to_db
  end # module Sqlite
end # module CityUTC
