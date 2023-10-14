class StoriesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @stories = Story.all
    render json: @stories
  end

  def show
    @story = Story.find(params[:id])
    render json: @story
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      render json: @story
    else
      render :nothing => true, :status => 400
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update(story_params)
      render json: @story
    else
      render :nothing => true, :status => 400
    end
  end

  def destroy
    @story = Story.find(params[id])
    @story.destroy!
  end


  private

  def story_params
    params.require(:story).permit(:title, :contents)
  end
end
