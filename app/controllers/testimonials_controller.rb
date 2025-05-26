class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [ :edit, :update, :destroy ]
  before_action :authenticate_seller!
  before_action :set_seller

  # GET /testimonials/new
  def new
    @testimonial = Testimonial.new
  end

  # POST /testimonials
  def create
    @testimonial = Testimonial.new(testimonial_params)
    @testimonial.seller = @seller
    if @testimonial.save
      redirect_to seller_url(@seller), notice: "Testimonial added successfully."
    else
      render :new
    end
  end

  # GET /testimonials/:id/edit
  def edit
  end

  # PATCH/PUT /testimonials/:id
  def update
    if @testimonial.update(testimonial_params)
      redirect_to seller_url(@seller), notice: "Testimonial updated successfully."
    else
      render :edit
    end
  end

  # DELETE /testimonials/:id
  def destroy
    @testimonial.destroy
    redirect_to seller_url(@seller), notice: "Testimonial deleted successfully"
  end

  private

  def set_testimonial
    @testimonial = Testimonial.find(params[:id])
  end

  def testimonial_params
    params.require(:testimonial).permit(:client, :details)
  end

  def set_seller
    @seller = Seller.find(params[:seller_id])
    unless current_seller == @seller
        redirect_to root_path, alert: "You are not authorized to manage testimonials for this seller."
    end
  end
end
