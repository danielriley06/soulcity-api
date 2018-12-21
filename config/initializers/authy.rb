# frozen_string_literal: true

require 'authy'

Authy.api_key = Rails.application.credentials.authy[:api_key]
Authy.api_uri = 'https://api.authy.com'
