class SellersController < ApplicationController
    before_action :set_seller, only: %i[ show edit update ]
    before_action :authenticate_seller!, except: %i[ index show ]
    before_action :authenticate_buyer!, only: %i[ index ]
    before_action :same_seller, only: %i[ edit update ]

    def index
        @sellers = Seller.where(country: current_buyer.country)
    end

    def show
    end

    def edit
    end

    def update
        if @seller.update(seller_params)
            redirect_to @seller, notice: "Profile updated successfully."
        else
            render :edit
        end
    end

    private
    def set_seller
        @seller = Seller.friendly.find(params[:id])
    end

    def seller_params
        if params[:seller][:solutions].is_a?(String)
            params[:seller][:solutions] = params[:seller][:solutions].split(",").map(&:strip)
        end
        if params[:seller][:pain_points].is_a?(String)
            params[:seller][:pain_points] = params[:seller][:pain_points].split(",").map(&:strip)
        end
        params.require(:seller).permit(:first_name, :last_name, :bio, :position, :city, :state, :country, :zip_code, :industry, :profile_photo, solutions: [], pain_points: [])
    end

    def same_seller
        unless current_seller == @seller
            redirect_to root_path, alert: "You are not authorized to edit this seller."
        end
    end
end
