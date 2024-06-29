class GamesController < ApplicationController

  def create
    existing_game = Game.fetch_game
    Game.new
  end

  private

  def create_game_params
    params.require(:users).permit(:username)
  end
end
