# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
require 'anycable-rails' if ENV['CABLE_URL']

# Initialize the Rails application.
Rails.application.initialize!
