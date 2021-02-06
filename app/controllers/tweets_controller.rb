class TweetsController < ApplicationController
  def index
  end

  private

  def message_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end
end
