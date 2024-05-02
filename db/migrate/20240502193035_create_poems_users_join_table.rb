# frozen_string_literal: true

class CreatePoemsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :poems, :users do |t|
      t.index :poem_id
      t.index :user_id
    end
  end
end
