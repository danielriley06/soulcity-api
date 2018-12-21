# frozen_string_literal: true

module Context
  class CurrentUserContext < GraphQL::Query::Context
    def current_user
      self[:current_user]
    end
  end
end
