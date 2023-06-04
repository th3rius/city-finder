# frozen_string_literal: true

# Enables the unaccent extension for better search results
class CreateUnaccentExtension < ActiveRecord::Migration[5.2]
  def up
    execute 'CREATE EXTENSION IF NOT EXISTS unaccent;'
  end

  def down
    execute 'DROP EXTENSION IF EXISTS unaccent;'
  end
end
