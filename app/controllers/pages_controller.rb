require "ostruct"  # Add this at the top if not already present


class PagesController < ApplicationController
  # Home feed
  def home
    @user = current_user

    # Show all posts (or later, only posts from users the current_user follows)
    @posts = Post.includes(:user, comments: :user).order(created_at: :desc)
  end

  # Workouts page
  def workouts
  def index
    @posts = Post.includes(:user, video_attachment: :blob)
                 .where.not(active_storage_attachments: { record_id: nil }) # filter only posts with attachments
                 .order(created_at: :desc)
  end
  end

  # Profile page for current_user
  def profile
    @user = current_user
    @posts = @user.posts.order(created_at: :desc)
    @tagged_posts = @user.saved_posts.includes(:user).order(created_at: :desc)  # <-- add this
    @saved_posts = @user.saved_posts.includes(:user).order(created_at: :desc)  # <-- add this
  end
# Profile tabs via AJAX
def profile_tab
  tab = params[:tab]

  case tab
  when "posts"
    @posts = current_user.posts.order(created_at: :desc)
    render partial: "shared/profile_posts", locals: { posts: @posts }
  when "saved"
  @saved_posts = current_user.saved_posts.includes(:user).order(created_at: :desc)
  render partial: "shared/profile_saved", locals: { posts: @saved_posts }

  when "tagged"
    @tagged_posts = current_user.tagged_posts.includes(:user).order(created_at: :desc)
    render partial: "shared/profile_tagged", locals: { posts: @tagged_posts }
  else
    head :bad_request
  end
end


  # Messages page
  def messages
  end

  # Notifications page
  def notifications
  end

  # Settings page
  def settings
  end
end
