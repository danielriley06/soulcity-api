Sequel.migration do
  change do
    create_table :divisions do
      primary_key :id
      String :name
      String :description
      Integer :parent_id, index: true
    end
  end
end
