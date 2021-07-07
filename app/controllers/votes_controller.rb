class VotesController < ApplicationController
  
  def create
    vote = Vote.new(vote_params)
    if vote.save
      redirect_to root_path
    else 
      flash.now[:danger] = "Something went wrong!"
    end
  end

  private

  def vote_params
     params.require(:vote).permit(:user_id, :article_id)
  end
end
