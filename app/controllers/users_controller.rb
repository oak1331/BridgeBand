class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :show]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order('created_at DESC')

    favorites = Favorite.where(user_id: @user.id).pluck(:tweet_id)
    @favorite_tweet = Tweet.find(favorites)

    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end