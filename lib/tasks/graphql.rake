# frozen_string_literal: true

require 'graphql/rake_task'

namespace :graphql do
  desc 'Dump graphql schema'
  task dump_schema: :environment do
    GraphQL::RakeTask.new(schema_name: 'SoulcityApiSchema')
  end
end
