
ActiveRecord::Schema.define(version: 20160806225230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "url"
  end

  create_table "reviews", force: :cascade do |t|
    t.string  "reviewer"
    t.text    "body"
    t.integer "rating"
    t.integer "restaurant_id"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id", using: :btree
  end

  add_foreign_key "reviews", "restaurants"
end
