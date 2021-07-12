class VotesController < ApplicationController
  before_action :logged_in_user
  
  def create
    vote = Vote.new(article_id:params[:format].to_i, user_id:current_user.id)
    if vote.save
      redirect_to category_path(vote.article.category.id)
    else 
      flash.now[:danger] = "Something went wrong!"
    end
  end

  def destroy
    vote = Vote.find_by(user_id:current_user.id, article_id:params[:id].to_i)
    vote.delete
    redirect_to category_path(vote.article.category.id)
  end
  
  private

  def vote_params
     params.permit(:id,:format)
  end
end
