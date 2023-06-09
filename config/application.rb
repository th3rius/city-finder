# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'dotenv-rails'
require 'selenium-webdriver'
require 'warning'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Load dotenv only in development or test environment
Dotenv::Railtie.load if %w[development test].include? ENV['RAILS_ENV']

# Ignore a few internal gem warnings we can do nothing about
[/Using the last argument as keyword parameters is deprecated/,
 /The called method `.*' is defined here/,
 /already initialized constant .*/,
 /previous definition of .* was here/].each { |warning| Warning.ignore(warning) }

module CityFinder
  # Main application
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
  end
end
