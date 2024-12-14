# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
    ActiveRecord::Base.establish_connection(:adapter => "postgresql", :dbfile => ":memory:", database: 'edgar_test7')

    # Add more helper methods to be used by all tests here...
  end
end
