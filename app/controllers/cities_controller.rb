# frozen_string_literal: true

class CitiesController < ApplicationController
  def index
    @state_options = State.order(:name)
                          .pluck(:name, :code)
                          .unshift(['None', nil])

    @cities = City.joins(:state)
                  .search_by_name(params[:query])
                  .with_pg_search_highlight
    @cities = @cities.where(states: { code: params[:state] }) if params[:state].present?
  end
end
