class LikesController < ApplicationController
  before_action :set_post

  def toggle
    like = @post.likes.find_by(user: current_user)

    if like
      like.destroy
      liked = false
    else
      @post.likes.create(user: current_user)
      liked = true
    end

    render json: { success: true, liked: liked, count: @post.likes.count }
  end

  private

def set_post
  @post = Post.find(params[:id])
end

end
