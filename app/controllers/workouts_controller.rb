class WorkoutsController < ApplicationController
  def index
    @posts = Post.joins(video_attachment: :blob)  # only posts with attached videos
                 .includes(:user)
                 .order(created_at: :desc)
  end
end
