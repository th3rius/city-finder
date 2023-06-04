# frozen_string_literal: true

# Represents a Brazil's federated state
class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states, id: false do |t|
      t.primary_key :ibge_code, :integer, default: nil
      t.string :name, limit: 40, null: false
      t.string :code, limit: 2, null: false, index: true
    end
  end
end
