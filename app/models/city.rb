# frozen_string_literal: true

# Represents a Brazil's federated city
class City < ApplicationRecord
  include PgSearch::Model

  belongs_to :state, foreign_key: :state_ibge_code, inverse_of: :cities
  pg_search_scope :search_by_name, against: :name, ignoring: :accents, using: {
    tsearch: {
      dictionary: 'portuguese',
      prefix: true,
      highlight: {
        StartSel: '<b>',
        StopSel: '</b>'
      }
    }
  }
end
