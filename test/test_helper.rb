ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# addition
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Allow context to be used like describe
  class << self
    alias :context :describe
  end

  # Add more helper methods to be used by all tests here...
end

class IntegrationTest < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  register_spec_type(/integration$/, self)
end
