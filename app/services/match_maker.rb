class MatchMaker
  def make_match
    begin
      players = PlayerQueueManager.pop_two!
      start_game(players)
    raise Exception
      # todo open cable
      return
    end
  end

  def start_game(players)
    @gm = GameMaster.new
    @gm.create_game(players)
  end
end

