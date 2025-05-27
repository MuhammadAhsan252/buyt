class StatesController < ApplicationController
    def index
      country = params[:country]
      states = CS.states(country.to_sym) || []
      render json: states
    end
end
