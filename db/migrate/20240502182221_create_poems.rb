# frozen_string_literal: true

class CreatePoems < ActiveRecord::Migration[7.0]
  def change
    create_table :poems do |t|
      t.string :lines
      t.timestamps
    end
  end
end
