source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false

# Improves copy-on-write performance for MRI
gem 'nakayoshi_fork', '~> 0.0.4'

# Database/PG support
gem 'pg', '>= 0.18', '< 2.0'
gem "sequel-rails"
gem 'ctes_in_my_pg', github: 'kmurph73/ctes_in_my_pg', branch: 'rails-5-2-0'
gem "search_object", "~> 1.2"
gem "search_object_graphql", "~> 0.1"
gem "mainstreet", "~> 0.2.0"

# Authentication & Authorization
gem "knock", "~> 2.1"
gem "jwt", "~> 1.5"
gem "access-granted", "~> 1.3"
gem 'rack-cors'

# GraphQL API
gem "graphql", "~> 1.8"
gem 'apollo_upload_server', '2.0.0.beta.1'
gem "graphql-query-resolver", "~> 0.2.0"

# Redis
gem 'redis', '~> 4.0'
gem "connection_pool", "~> 2.2"

# File Attachments
gem 'shrine', '~> 2.1'
gem "aws-sdk-s3", "~> 1.30"
gem "image_processing", "~> 1.7"

# Validation libs
gem "email_validator", "~> 1.6"
gem 'phonelib', "~> 0.6"


# Pagination
gem "kaminari", "~> 1.1"

# Seed data
gem "sprig", "~> 0.3.0"

# Background jobs
gem 'sidekiq', '~> 5.2.1'
gem 'sidekiq-cron', '~> 1.0.4'
gem 'redis-namespace', '~> 1.6.0'

# Twilio integration
gem "authy", "~> 2.7"
gem "twilio-ruby", "~> 5.17"

# Bitly integration
gem "bitly", "~> 1.1"

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
