class PostsController < ApplicationController
before_action :set_post, only: [:save, :unsave, :destroy]
# posts_controller.rb



def likes_count
  post = Post.find(params[:id])
  liked = post.likes.exists?(user_id: current_user.id)
  render json: { count: post.likes.count, liked: liked }
end



def show
  @post = Post.find(params[:id])
  render partial: "shared/posts_modal", locals: { post: @post }
end


  def destroy
    if @post.user == current_user
      @post.destroy
      respond_to do |format|
        format.html { redirect_to home_path, notice: "Post deleted successfully." }
        format.json { render json: { success: true, message: "Post deleted." } }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: "You are not authorized to delete this post." }
        format.json { render json: { success: false, error: "Unauthorized" }, status: :unauthorized }
      end
    end
  end

def toggle_like
  post = Post.find(params[:id])
  like = post.likes.find_by(user: current_user)
  if like
    like.destroy
  else
    post.likes.create(user: current_user)
  end
  render json: { likes_count: post.likes.count }
end

def saved_status
  post = Post.find(params[:id])
  render json: { saved: current_user.saved_posts.exists?(post.id) }
end

def save
  post = Post.find(params[:id])
  current_user.saved_posts << post unless current_user.saved_posts.include?(post)
  render json: { success: true }
end

  def unsave
    post = Post.find(params[:id])
    # remove association (adjust to your association name)
    if current_user.saved_posts.exists?(post.id)
      current_user.saved_posts.delete(post)
      render json: { success: true }, status: :ok
    else
      render json: { success: false, error: "Not saved" }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: "Not found" }, status: :not_found
  end



  respond_to do |format|
    format.html { redirect_back(fallback_location: root_path) }
    format.js   # looks for unsave.js.erb
  end




def create
  @post = current_user.posts.new(post_params)
  if @post.save
    redirect_to home_path , notice: "Post created successfully."
  else
    render :new
  end
end

  private
  
  def set_post
    @post = Post.find(params[:id])
  end
def post_params
  params.require(:post).permit(:content, :image)
end
end
