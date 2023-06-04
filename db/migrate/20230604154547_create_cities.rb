# frozen_string_literal: true

# Represents a Brazil's federated city
class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities, id: false do |t|
      t.primary_key :ibge_code, :integer, default: nil
      t.string :name, limit: 40, null: false
      t.integer :state_ibge_code, null: false
    end

    add_foreign_key :cities, :states, column: :state_ibge_code, primary_key: :ibge_code
  end
end
