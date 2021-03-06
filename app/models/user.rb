class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :comments
  has_many :favorites
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  
  validates :name, presence: true

  def favorited_by?(tweet_id)
    favorites.where(tweet_id: tweet_id).exists?
  end

  def following?(user)
    followings.include?(user)
  end

  def follow(user_id)
    relationships.create(follower: user_id)
  end

  def unfollow(relathinoship_id)
    relationships.find(relathinoship_id).destroy!
  end
end
