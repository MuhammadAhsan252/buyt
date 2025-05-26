class CitiesController < ApplicationController
    def index
      state = params[:state]
      country = params[:country]
      cities = CS.cities(state.to_sym, country.to_sym) || []
      render json: cities
    end
end
