class AddUserIdToReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :user
  end
end
