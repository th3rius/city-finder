# frozen_string_literal: true

class CitiesController < ApplicationController
  def index
    @cities = City.search_by_name(params[:query]).with_pg_search_highlight
  end
end
