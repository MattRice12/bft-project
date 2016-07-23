class ChangeVoteCountInFoodtruck < ActiveRecord::Migration[5.0]
  def change
    change_table :foodtrucks do |t|
      t.rename :vote_count, :votes_count
    end
  end
end
