# frozen_string_literal: true

class PoemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @poems = Poem.all
  end

  def show
    @poem = Poem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @poem = Poem.new
  end

  def edit
    @poem = Poem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def create
    @poem = Poem.new(poem_params)
    @poem.users = [current_user]
    if @poem.lines.present? && @poem.save
      redirect_to @poem, notice: 'Poem successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @poem = Poem.find(params[:id])
    users = @poem.users
    if users.last == current_user
      redirect_to @poem,
                  alert: 'You may not modify the poem until someone else does!' and return
    end
    new_lines = new_lines_params[:new_lines]
    @poem.lines << "\r\n#{new_lines}"
    @poem.users.push(current_user)
    if @poem.save
      redirect_to @poem
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def poem_params
    p = params.require(:poem).permit(:lines)
    render :new, status: :unprocessable_entity if p[:lines].length > Poem::MAX_VERSE_CHAR_LENGTH
    p
  end

  def new_lines_params
    p = params.require(:poem).permit(:new_lines)
    render :new, status: :unprocessable_entity if p[:new_lines].length > Poem::MAX_VERSE_CHAR_LENGTH
    p
  end
end
