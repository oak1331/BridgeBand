class FavoritesController < ApplicationController
  before_action :tweet_params
  before_action :authenticate_user!

  def create
    @favorite = Favorite.create(user_id: current_user.id, tweet_id: @tweet.id )
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, tweet_id:  @tweet.id )
    @favorite.destroy
  end

  private
  def tweet_params
    @tweet = Tweet.find(params[:tweet_id])
  end

end
