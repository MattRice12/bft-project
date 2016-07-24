class AddFavoriteListToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :favorite_list, :string
  end
end
