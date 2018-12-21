Bitly.configure do |config|
  config.api_version = 3
  config.access_token = Rails.application.credentials[Rails.env.to_sym][:bitly][:access_token]
end