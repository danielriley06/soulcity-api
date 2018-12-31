# frozen_string_literal: true

begin
  SequelRails.setup(Rails.env)

  DB = Sequel::Model.db
  DB.extension :pg_array, :pg_json, :pg_enum, :pagination
rescue Sequel::Error => e
  Rollbar.error(e)
end
