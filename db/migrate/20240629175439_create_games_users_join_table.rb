class CreateGamesUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :games_users, id: false do |t|
      t.bigint :game_id
      t.bigint :user_id
    end

    add_index :games_users, :game_id
    add_index :games_users, :user_id
  end
end
