# frozen_string_literal: true

class Story < ApplicationRecord
  belongs_to :game

  validates :title, presence: true
  validates :contents, presence: true, length: { minimum: 10 }
end
