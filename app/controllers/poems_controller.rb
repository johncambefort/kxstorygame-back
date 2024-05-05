# frozen_string_literal: true

class PoemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
    @poem = Poem.new
  end

  def index
    @poems = Poem.all
  end

  def show
    @poem = Poem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def create
    @poem = Poem.new(poem_params)
    @poem.users = [current_user]
    if @poem.lines.present? && @poem.save
      redirect_to root_path, notice: 'Poem successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @poem = Poem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def update
    @poem = Poem.find_by_id(params[:id])
    if @poem.update(poem_params)
      @poem.users.push(current_user) if !@poem.users.include?(current_user)
      redirect_to @poem
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def poem_params
    params.require(:poem).permit(:lines)
  end
end
