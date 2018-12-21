source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem "sequel-rails"
gem 'puma', '~> 3.11'
gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false

# Authentication & Authorization
gem "knock", "~> 2.1"
gem "authy", "~> 2.7"
gem "twilio-ruby", "~> 5.17"
gem "email_validator", "~> 1.6"
gem "access-granted", "~> 1.3"
gem 'phonelib'
gem 'rack-cors'

gem "graphql", "~> 1.8"
gem 'apollo_upload_server', '2.0.0.beta.1'
gem "ancestry", "~> 3.0"

gem "sprig", "~> 0.3.0"

gem "search_object", "~> 1.2"
gem "search_object_graphql", "~> 0.1"

gem "graphql-query-resolver", "~> 0.2.0"

gem "mainstreet", "~> 0.2.0"

gem "sidekiq", "~> 5.2"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 3.8"
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'factory_bot_rails'
  gem 'awesome_print'
  gem "ffaker", "~> 2.10"
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "graphiql-rails"
  gem "annotate", "~> 2.7"
  gem "letter_opener", "~> 1.6"
end

gem "rollbar", "~> 2.18"

gem "bitly", "~> 1.1"

gem "kaminari", "~> 1.1"
