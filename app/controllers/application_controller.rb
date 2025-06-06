class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # app/controllers/application_controller.rb
  helper_method :current_user

  def current_user
    current_buyer || current_seller
  end
end
