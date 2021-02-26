class FavoritesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    if @tweet.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, tweet_id: @tweet.id)
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @favorite = Favorite.find_by(user_id: current_user.id, tweet_id: @tweet.id)
    @favorite.destroy
  end

end
