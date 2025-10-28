class Tagging < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # when tagging:
Notification.create!(
  user: tagged_user,
  actor: tagging_user,
  notifiable: post,
  message: "tagged you in a post"
)

end
