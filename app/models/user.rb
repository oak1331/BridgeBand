class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :comments
  has_many :favorites
  
  validates :name, presence: true

  def favorited_by?(tweet_id)
    favorites.where(tweet_id: tweet_id).exists?
  end
end
