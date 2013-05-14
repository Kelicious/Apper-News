class CommentsController < ApplicationController

  def new
    @comment = Comment.new(
      author_id: current_user.id,
      story_id: params[:id]
    )

    render 'reply'
  end

  def reply
    @comment = Comment.new(
      parent_id: params[:id],
      author_id: current_user.id,
      story_id: Comment.find(params[:id]).story_id
    )
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to @comment.story
    else
      render 'reply'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end
end