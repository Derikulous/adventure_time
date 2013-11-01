require "simplecov"
SimpleCov.start'rails'
ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/spec"
require "minitest/rails/capybara"
require "minitest/pride"
require "minitest/focus"
require "minitest/colorize"
include Capybara::DSL
include Devise::TestHelpers
Rails.application.routes.default_url_options[:host] = 'localhost:3000'

class ActiveSupport::TestCase

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  # signs in a user
  def sign_in(one)
    puts users(one).email
    visit new_user_session_path
    fill_in "email", with: users(one).email
    fill_in "password", with: "password"
    click_on "Sign in"
  end

  # Add more helper methods to be used by all tests here...
end

Turn.config.format = :outline
