# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities' do
  it 'finds Jaraguá do Sul' do
    get root_path, params: { query: 'jarag' }
    expect(response.body).to include('<b class="highlighted">Jaraguá</b> do Sul', '<b class="highlighted">Jaraguá</b>')
  end

  it 'filters states' do
    get root_path, params: { query: 'curit', state: 'PR' }
    expect(response.body).to include('<b class="highlighted">Curitiba</b>')
  end

  it 'ignores cedillas' do
    get root_path, params: { query: 'uruacu' }
    expect(response.body).to include('Uruaçu')
  end

  it 'ignores diatrics' do
    get root_path, params: { query: 'sao p', state: 'SP' }
    expect(response.body).to include('São <b class="highlighted">Paulo</b>')
  end

  it 'finds no results' do
    get root_path, params: { query: 'new jersey' }
    expect(response.body).to include('Try another search?')
  end

  it 'calls to action' do
    get root_path
    expect(response.body).to include 'Enter a search query to find cities'
  end
end
