# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :versions do
      primary_key :id
      foreign_key :grammar_id, :grammars, on_delete: :cascade, null: false
      column :identifier, :string, null: false, index: true

      column :created_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP

      index %i[grammar_id identifier], unique: true
    end
  end
end
