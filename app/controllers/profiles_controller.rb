class ProfilesController < ApplicationController
  before_action :authenticate_user!  # make sure only logged-in users can view profiles






  def show
    # If you want to show the profile of the logged-in user:
    @user = current_user
    # Or, to show a profile by id from URL:
    # @user = User.find(params[:id])

    # Get posts for that user
    @posts = @user.posts.order(created_at: :desc)
    @saved_posts = @user.saved_posts.order(created_at: :desc)
    
  end
end
