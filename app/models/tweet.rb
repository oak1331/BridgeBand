class Tweet < ApplicationRecord
  has_one_attached :image

  validates :title, :image, presence: true
  belongs_to :user
end