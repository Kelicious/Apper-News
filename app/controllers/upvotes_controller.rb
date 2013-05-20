class UpvotesController < ApplicationController
  def create
    opts = {story_id: params[:id], user_id: current_user.id}
    upvote = Upvote.find(:first, conditions: opts) || Upvote.new(opts)
    if upvote.value == 1
      flash[:errors] = ["Already upvoted this story"]
    elsif (upvote.value = 1) && upvote.save
      flash[:notice] = ["Upvoted!"]
    else
      flash[:errors] = upvote.errors.full_messages
    end
    
    redirect_to root_url
  end

  def destroy
    opts = {story_id: params[:id], user_id: current_user.id}
    upvote = Upvote.find(:first, conditions: opts) || Upvote.new(opts)
    if upvote.value == -1
      flash[:errors] = ["Already downvoted this story"]
    elsif (upvote.value = -1) && upvote.save
      flash[:notice] = "Downvoted!"
    else
      flash[:errors] = upvote.errors.full_messages
    end

    redirect_to root_url
  end
end