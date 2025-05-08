class Game < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :poem

  def self.fetch_game

  end
end
