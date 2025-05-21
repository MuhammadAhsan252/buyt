class BuyersController < ApplicationController
    before_action :set_buyer, only: %i[ show edit update ]
    before_action :authenticate_buyer!, except: %i[ index show ]
    before_action :same_buyer, only: %i[ edit update ]

    def index
        @buyers = Buyer.all
    end

    def show
    end

    def edit
        @buyer.stakeholders.build
    end

    def update
        if @buyer.update(buyer_params)
            redirect_to @buyer, notice: "Buyer was successfully updated."
        else
            render :edit
        end
    end

    private
    def set_buyer
        @buyer = Buyer.find(params[:id])
    end

    def buyer_params
        if params[:buyer][:solutions].is_a?(String)
            params[:buyer][:solutions] = params[:buyer][:solutions].split(",").map(&:strip)
        end
        if params[:buyer][:pain_points].is_a?(String)
            params[:buyer][:pain_points] = params[:buyer][:pain_points].split(",").map(&:strip)
        end
        params.require(:buyer).permit(:first_name, :last_name, :bio, :position, :city, :state, :country, :zip_code, :industry, :profile_photo, :ai_strategy, solutions: [], pain_points: [], stakeholders_attributes: [ :id, :name, :position, :linkedin, :_destroy ])
    end

    def same_buyer
        unless current_buyer == @buyer
            redirect_to root_path, alert: "You are not authorized to edit this buyer."
        end
    end
end
