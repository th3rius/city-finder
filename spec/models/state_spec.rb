# frozen_string_literal: true

require 'rails_helper'

RSpec.describe State do
  describe 'associations' do
    it 'has many cities' do
      association = described_class.reflect_on_association(:cities)
      expect(association.macro).to eq :has_many
    end

    it 'has the correct foreign key for cities' do
      association = described_class.reflect_on_association(:cities)
      expect(association.options[:foreign_key]).to eq :state_ibge_code
    end
  end
end
