# frozen_string_literal: true

# Controller for the GraphQL API endpoint
class GraphqlController < ApplicationController
  before_action :authenticate_user

  # rubocop:disable Metrics/MethodLength
  def execute
    # rubocop:enable Metrics/MethodLength
    if params[:query]
      variables = ensure_hash(params[:variables])
      result = SoulcityApiSchema.execute(
        query: params[:query],
        variables: variables,
        context: context
      )
    else
      result = SoulcityApiSchema.multiplex(
        queries
      )
    end
    render body: result.to_json, content_type: 'application/json'
  end

  private

  def context
    {
      current_user: current_user
    }
  end

  def queries
    params.permit(_json: [:query, :operationName, { variables: {} }])
          .to_hash['_json'].map do |query|
      query.transform_keys do |k|
        k.underscore.to_sym
      end.merge(context: context)
    end
  end

  # rubocop:disable Metrics/MethodLength
  def ensure_hash(ambiguous_param)
    # rubocop:enable Metrics/MethodLength
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
