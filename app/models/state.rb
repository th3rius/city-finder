# frozen_string_literal: true

# Represents a Brazil's federated state
class State < ApplicationRecord
  has_many :cities, foreign_key: :state_ibge_code, inverse_of: :states, dependent: :destroy
end
