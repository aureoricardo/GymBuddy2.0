class FollowRequestsController < ApplicationController
  before_action :authenticate_user!

  # List pending follow requests for current user
  def index
    @requests = current_user.followers.where(status: 'pending')
  end

  # Accept a follow request
  def update
    follow = current_user.followers.find(params[:id])

    if follow.update(status: 'accepted')
      # Trigger notification after acceptance
      follow.send(:create_notification)

      flash[:notice] = "#{follow.follower.username} is now following you."
    else
      flash[:alert] = "Unable to accept request."
    end

    redirect_to follow_requests_path
  end

  # Reject a follow request
  def destroy
    follow = current_user.followers.find(params[:id])
    follow.destroy
    flash[:notice] = "Follow request rejected."
    redirect_to follow_requests_path
  end
end
