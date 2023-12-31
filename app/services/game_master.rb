class GameMaster
  def create_game(players)
    @players = players
    @game = Game.create(status: :active)
  end
  
  def end_game
    @game.status = :archived
    @game.save!
  end
end
