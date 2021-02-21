class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: :edit
  before_action :set_tweet, only: [:edit, :show]

  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless Tweet.find(params[:id]).user.id.to_i == current_user.id
      redirect_to action: :index
    end
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end