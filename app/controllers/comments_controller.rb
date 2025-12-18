class CommentsController < ApplicationController
  before_action :authenticate_user!

def create
  post = Post.find(params[:post_id])
  comment = post.comments.build(body: params[:body])
  comment.user = current_user

  if comment.save
    render json: {
      success: true,
      comment: {
        id: comment.id,
        body: comment.body,
        username: current_user.username
      }
    }
  else
    render json: { success: false, errors: comment.errors.full_messages }, status: 422
  end
end

  private

def comment_params
  params.require(:comment).permit(:body)
end

end
