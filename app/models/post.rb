class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one_attached :image
  after_commit :resize_image, on: [:create, :update]
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tagged_users, through: :taggings, source: :user
  has_many :saves
  has_one_attached :video
  has_many :savers, through: :saves, source: :user
end


private

def resize_image
  return unless image.attached? && image.variable?

  resized = image.variant(resize_to_limit: [800, 800]).processed
  image.attach(resized)
end
