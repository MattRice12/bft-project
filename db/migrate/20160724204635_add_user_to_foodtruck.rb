class AddUserToFoodtruck < ActiveRecord::Migration[5.0]
  def change
    add_reference :foodtrucks, :user, foreign_key: true
  end
end
