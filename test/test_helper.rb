require "simplecov"
SimpleCov.start "rails" unless ENV["NO_COVERAGE"]

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "mocha/mini_test"

# Improved Minitest output (color and progress bar)
require "minitest/reporters"
Minitest::Reporters.use!(
    Minitest::Reporters::ProgressReporter.new,
    ENV,
    Minitest.backtrace_filter
)

# Capybara and poltergeist integration
require "capybara/rails"
require "capybara/poltergeist"
Capybara.javascript_driver = :poltergeist

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

ActionDispatch::IntegrationTest.extend Minitest::Spec::DSL

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

# See: https://gist.github.com/mperham/3049152
class ActiveRecord::Base
    mattr_accessor :shared_connection
    @@shared_connection = nil

    def self.connection
        @@shared_connection || ConnectionPool::Wrapper.new(:size => 1) { retrieve_connection }
    end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

class ActionController::TestCase
    include Devise::TestHelpers
end
