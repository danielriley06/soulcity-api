# frozen_string_literal: true

Rake::Task['db:create'].clear
namespace :db do
  desc 'Create the database defined in config/database.yml for the current Rails.env'
  task :create do
    database_config = {
      Rails.env => Rails.application.config_for('database')
    }

    ::SequelRails::Configuration.for(Rails.root, database_config)

    abort "Could not create database for #{Rails.env}." unless SequelRails::Storage.create_environment(Rails.env)
  end
end
