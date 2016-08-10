class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :user
      t.text :body
      t.integer :rating
      t.references :restaurant, foreign_key: true
    end
  end
end
