# frozen_string_literal: true

# Adds the search vector to the cities table
class AddSearchVectorToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :search_vector, :tsvector
  end
end
