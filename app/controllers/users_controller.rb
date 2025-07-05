class UsersController < ApplicationController
  # This action will receive AJAX POST with user location
  def update_location
    # Assuming you have current_user set via authentication
    if current_user
      current_user.update(
        latitude: params[:latitude],
        longitude: params[:longitude]
      )
      render json: { status: "success" }
    else
      render json: { status: "error", message: "Not logged in" }, status: :unauthorized
    end
  end
end
