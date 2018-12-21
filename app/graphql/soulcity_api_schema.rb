# frozen_string_literal: true

class SoulcityApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Default maximum for all Relay connections that do not specify max_page_size
  default_max_page_size 100

  def self.id_from_object(object, type_definition, _query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  def self.object_from_id(id, _query_ctx)
    return unless id.present?

    record_class_name, record_id = GraphQL::Schema::UniqueWithinType.decode(id)
    record_class = record_class_name.safe_constantize
    record_class&.find_by id: record_id
  end

  def self.resolve_type(_type, obj, _ctx)
    type = "::Types::#{obj.class}Type".safe_constantize
    return type if type.present?

    raise ArgumentError, "Cannot resolve type for class #{obj.class.name}"
  end
end
