# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :grammars do
      primary_key :id

      column :name, :string, null: false, index: { unique: true }
      column :description, :text
      column :repository_url, :string, null: false

      column :created_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
