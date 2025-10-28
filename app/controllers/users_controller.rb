class UsersController < ApplicationController

  def profile
    @user = current_user
    case params[:tab]
    when 'tagged'
      @posts = [] # Replace later
    when 'saved'
      @posts = [] # Replace later
    else
      @posts = @user.posts.order(created_at: :desc) # always use .order
    end
  end


    def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(media_attachment: :blob) # fetch user’s posts
    end


  def search
  query = params[:q].to_s.downcase
  @users = User.where("LOWER(username) LIKE ?", "%#{query}%").limit(10)

  render json: @users.map { |u|
    {
      id: u.id,
      username: u.username,
      avatar_url: u.avatar.attached? ? url_for(u.avatar) : nil
    }
  }
  end


  def update_location
    if current_user
      current_user.update(latitude: params[:latitude], longitude: params[:longitude])
      render json: { status: "success" }
    else
      render json: { status: "error", message: "Not logged in" }, status: :unauthorized
    end
  end
end
