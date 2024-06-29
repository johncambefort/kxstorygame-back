class RemovePoemUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :poems, :users

    add_reference :poems, :game, foreign_key: true
  end
end
