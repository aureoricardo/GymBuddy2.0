class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :actor, class_name: "User"  # sender
  belongs_to :notifiable, polymorphic: true
  

    scope :unread, -> { where(read: false) }
end
