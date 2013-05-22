class CommentsController < ApplicationController

  def new
    @comment = Comment.new(
      author_id: current_user.id,
      story_id: params[:story_id]
    )

    render 'reply'
  end

  def reply
    @comment = Comment.new(
      parent_id: params[:comment_id],
      author_id: current_user.id,
      story_id: Comment.find(params[:comment_id]).story_id
    )
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:success] = "Comment submitted!"
      redirect_to @comment.story
    else
      render 'reply'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
