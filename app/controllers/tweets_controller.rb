class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:nickname, :image, :text, :title)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end