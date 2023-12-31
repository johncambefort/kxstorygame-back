# frozen_string_literal: true

class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :contents

      t.timestamps
    end
  end
end
