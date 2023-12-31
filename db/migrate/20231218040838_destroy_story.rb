# frozen_string_literal: true

class DestroyStory < ActiveRecord::Migration[7.0]
  def up
    remove_column :games, :stories_id
    add_column :games, :title, :string
    add_column :games, :contents, :text
    drop_table :stories
  end

  def down
    create_table :stories
    add_reference :games, :stories
  end
end
