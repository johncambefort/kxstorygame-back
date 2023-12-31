# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :status

      t.timestamps
    end

    add_reference :games, :story
  end
end
