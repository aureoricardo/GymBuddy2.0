class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  scope :between, -> (sender_id, recipient_id) do
    where("(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)",
          sender_id, recipient_id, recipient_id, sender_id)
  end
end
