class PlayerQueueManager
  def initialize
    # TODO instantiate/fetch player stack from DB
    # TODO use redis
    @player_stack = Array.new
  end

  def push(player)
    @player_stack.push(player)
  end

  def pop
    @player_stack.pop
  end

  def pop_two!(player)
    # todo make into transaction, then rollback if not 2 players?
    players = [pop, pop]
    fail Exception.new if players.count != 2
    players
  end
end
