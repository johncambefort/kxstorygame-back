# frozen_string_literal: true

class Game < ApplicationRecord
  validates :status, presence: true
  enum :status, %i[active archived]

  def self.create_game
    game = create!(status: :active)
    game.id
  end
end
