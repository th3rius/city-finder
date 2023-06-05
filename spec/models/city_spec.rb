# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City do
  describe 'search functionality' do
    it 'responds to search_by_name' do
      expect(described_class).to respond_to(:search_by_name)
    end
  end
end
