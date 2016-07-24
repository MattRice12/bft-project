class AddCommentsInFoodtrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :foodtrucks, :comments, :text
  end
end
