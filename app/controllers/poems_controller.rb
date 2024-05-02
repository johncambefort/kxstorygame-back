# frozen_string_literal: true

class PoemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @poem = Poem.new
  end

  def edit; end

  def create
    @poem = Poem.new(poem_params)
    @poem.users = [current_user]
    if @poem.lines.present? && @poem.save
      redirect_to root_path, notice: 'Poem successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def poem_params
    params.require(:poem).permit(:lines)
  end
end
