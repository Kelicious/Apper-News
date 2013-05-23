class StoriesController < ApplicationController

  def index
    @stories = Kaminari.paginate_array(Story.popular).page(params[:page])
  end

  def new
    @story = Story.new()
    @story.comments.build
  end

  def create
    @story = Story.new(params[:story])
    if @story.save
      flash[:success] = "Story submitted!"
      redirect_to @story
    else
      render 'new'
    end
  end

  def show
    @story = Story.find(params[:id])
  end
end
