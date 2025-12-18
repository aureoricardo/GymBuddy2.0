class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  # Status can be 'pending' or 'accepted'
  validates :status, inclusion: { in: %w[pending accepted] }

  after_create :create_notification, if: -> { accepted? }

  # Helper methods
  def accepted?
    status == 'accepted'
  end

  def pending?
    status == 'pending'
  end

  private

  # Only create notification if follow is accepted
  def create_notification
    Notification.create!(
      user: followed,      # The user who receives the notification
      actor: follower,     # The user who performed the follow
      notifiable: self,
      message: "começou a seguir-te"
    )
  end
end
