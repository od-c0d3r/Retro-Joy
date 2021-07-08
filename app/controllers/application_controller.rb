class ApplicationController < ActionController::Base
    include SessionsHelper

    before_action :logged_in_user, only: :main

    def main
      @most_voted_art = most_voted_art
      @cat1_art = Category.first.articles.first
      @cat2_art = Category.second.articles.first
      @cat3_art = Category.third.articles.first
      @cat4_art = Category.fourth.articles.first
    end

    private

    def most_voted_art
      votes_hash = Vote.group(:article_id).count
      if most_voted_arr(votes_hash).nil?
        id_votes = [30]
      else
        id_votes = most_voted_arr(votes_hash)
      end
      Article.find_by(id:id_votes[0]) || Article.first
    end

    def logged_in_user
        unless logged_in?
          redirect_to login_url
        end
    end

    def most_voted_arr(hash)
      hash.max_by{|k,v| v}
    end
end
