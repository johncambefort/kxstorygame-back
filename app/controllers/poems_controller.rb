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
      redirect_to @poem, notice: 'Poem successfully created'
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
    new_lines = new_lines_params[:new_lines]

    @poem.lines << "\r\n#{new_lines}"
    @poem.users |= [current_user]

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
    return p
  end

  def new_lines_params
    p = params.require(:poem).permit(:new_lines)
    render :new, status: :unprocessable_entity if p[:new_lines].length > Poem::MAX_VERSE_CHAR_LENGTH
    return p
  end
end
