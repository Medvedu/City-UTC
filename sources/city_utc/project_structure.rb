# encoding: utf-8
# frozen_string_literal: true
module CityUTC
  # Dependencies from rubygems.org

  require 'sinatra'
  require 'timezone'
  require 'sqlite3'
  require 'sequel'

  # Project structure loader

  ##
  # Loads *.rb files in requested order

  def self.load(**params)
    Array(params[:files]).each do |f|
      require File.join __dir__, params[:folder].to_s, f
    end
  end
  private_class_method :load

  load files: %w(sqlite)

  load folder: 'models',
       files: %w(city timezone)

  load files: %w(utc_time web_server)
end # module CityUTC
