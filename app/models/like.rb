class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  


def create_notification
  Notification.create!(
    user: post.user,             # post owner
    actor: user,                 # liker
    notifiable: post,
    
    message: " liked your post ❤️"
  )
end


after_create :create_notification

end
