class GamesController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def create
    res = { id: Game.create_game }
    render json: res
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(params)
      render json: @game
    else
      render :nothing => true, :status => 400
    end
  end
end
