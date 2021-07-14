class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :logged_in_user, only: :main

  def main
    @most_voted_art = most_voted_art
    # @categories = Category.all
    @categories = Category.includes(:articles)
  end

  private

  def most_voted_art
    votes_hash = Vote.group(:article_id).count
    id_votes = if most_voted_arr(votes_hash).nil?
                 [44]
               else
                 most_voted_arr(votes_hash)
               end
    Article.find_by(id: id_votes[0]) || Article.first
  end

  def logged_in_user
    redirect_to login_url unless logged_in?
  end

  def most_voted_arr(hash)
    hash.max_by { |_k, v| v }
  end
end
