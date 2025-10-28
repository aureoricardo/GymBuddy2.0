class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :taggings
  has_many :tagged_posts, through: :taggings, source: :post
  has_many :comments, dependent: :destroy
  has_many :saves
  has_many :saved_posts, through: :saves, source: :post
  has_many :likes
  has_one_attached :video   # <-- this line is required


  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
has_many :received_messages, class_name: "Message", foreign_key: :receiver_id


  

  has_many :followers_relationships, class_name: "Follow", foreign_key: "followed_id"
  has_many :followers, through: :followers_relationships, source: :follower
  has_many :following_relationships, class_name: "Follow", foreign_key: "follower_id"
  has_many :following, through: :following_relationships, source: :followed
  
  # 👇 Add these two associations:
  has_many :notifications, dependent: :destroy  # notifications *received*
  has_many :sent_notifications, class_name: "Notification", foreign_key: :actor_id, dependent: :destroy  # notifications *sent by this user*


    def follows?(user)
    following.exists?(user.id)
    end


end
