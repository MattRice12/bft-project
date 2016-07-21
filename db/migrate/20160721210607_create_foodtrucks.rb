class CreateFoodtrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :foodtrucks do |t|
      t.string :name,             null: false
      t.string :cuisine,          null: false
      t.string :signature_item
      t.string :truck_pic
      t.string :yelp_url
      t.integer :vote_count,      default: 0
      
      t.timestamps
    end
  end
end
