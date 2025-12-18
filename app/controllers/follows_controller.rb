class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    followed_user = User.find(params[:followed_id])

    # Determine follow status
    follow_status = followed_user.private? ? 'pending' : 'accepted'

    # Create follow relationship
    follow = current_user.following_relationships.create(
      followed: followed_user,
      status: follow_status
    )

    if follow.persisted?
      flash[:notice] = follow_status == 'pending' ? 'Follow request sent.' : 'You are now following.'
    else
      flash[:alert] = 'Something went wrong.'
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    # Find the follow relationship
    follow = current_user.following_relationships.find_by(followed_id: params[:id])

    if follow
      follow.destroy
      flash[:notice] = 'Unfollowed successfully.'
    else
      flash[:alert] = 'Follow not found.'
    end

    redirect_back(fallback_location: root_path)
  end
end
