class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

def create_notification
  Notification.create!(
    user: post.user,             # post owner
    actor: user,                 # liker
    notifiable: post,
    message: " comentou no seu post "
  )
end


after_create :create_notification


end
