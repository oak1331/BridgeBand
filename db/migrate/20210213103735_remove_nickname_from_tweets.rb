class RemoveNicknameFromTweets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tweets, :nickname, :string
  end
end