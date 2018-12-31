# frozen_string_literal: true

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Store uploaded files on the local file system in a temporary directory
  # config.active_storage.service = :test

  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  #######################
  #### SEQUEL CONFIG ####
  #######################
  # Allowed options: :sql, :ruby.
  config.sequel.schema_format = :sql

  # Whether to dump the schema after successful migrations.
  # Defaults to false in production and test, true otherwise.
  config.sequel.schema_dump = true

  # These override corresponding settings from the database config.
  config.sequel.max_connections = 16
  config.sequel.search_path = %w[mine public]

  # Configure whether database's rake tasks will be loaded or not.
  #
  # If passed a String or Symbol, this will replace the `db:` namespace for
  # the database's Rake tasks.
  #
  # ex: config.sequel.load_database_tasks = :sequel
  #     will results in `rake db:migrate` to become `rake sequel:migrate`
  #
  # Defaults to true
  config.sequel.load_database_tasks = false

  # This setting disabled the automatic connect after Rails init
  config.sequel.skip_connect = false

  # Configure if Sequel should try to 'test' the database connection in order
  # to fail early
  config.sequel.test_connect = true

  # If you want to use a specific logger
  # config.sequel.logger = MyLogger.new($stdout)
end
