# frozen_string_literal: true

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
end
