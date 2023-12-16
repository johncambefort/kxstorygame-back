class Game < ApplicationRecord
  has_one :story, dependent: :destroy

  validates :status, presence: true
  enum :status, [ :active, :archived ]

  def self.create_game
    game = create!(status: :active)
    game.id
  end
end
