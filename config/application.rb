# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Not compat with Sequel
# require 'active_record/railtie'
# require 'active_storage/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SoulcityApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # We want to set up a custom logger which logs to STDOUT.
    # Docker expects your application to log to STDOUT/STDERR and to be ran
    # in the foreground.
    config.log_level = :debug
    config.log_tags  = %i[subdomain uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))

    config.action_cable.disable_request_forgery_protection = true
    config.action_cable.url = ENV['CABLE_URL']
    config.action_cable.mount_path = ENV['CABLE_URL'].nil? ? '/cable' : nil

    config.api_only = true

    config.sequel.after_connect = proc do
      Sequel::Model.plugin :validation_helpers
      Sequel::Model.plugin :nested_attributes
    end
  end
end
