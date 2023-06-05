# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Search' do
  it 'displays search results when cities are found' do
    visit root_path
    fill_in 'query', with: 'jarag'
    select 'Santa Catarina', from: 'state'
    click_button 'Search'
    expect(page).to have_content('Jaraguá do Sul')
  end

  it 'displays a message when no cities are found' do
    visit root_path
    fill_in 'query', with: 'new jersey'
    click_button 'Search'
    expect(page).to have_content('Oops! Seems we were unable to find your city.')
  end

  it 'displays a message when no search query is entered' do
    visit root_path
    click_button 'Search'
    expect(page).to have_content('Enter a search query to find cities in Brazil.')
  end
end
