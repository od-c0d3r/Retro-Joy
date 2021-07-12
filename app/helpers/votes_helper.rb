module VotesHelper
    def like_dislike(art)
        if current_user.liked_articles.include?(art)
            link_to "👎", vote_path(art.id), method: :delete
        else
            link_to "👍",    votes_path(art.id), method: :post
        end
    end

    def votes_counter(art)
        if art.votes.count == 0
            'No Likes'
        elsif  art.votes.count == 1
            '1 Like'
        else
            "#{art.votes.count} Likes"
        end
    end
    
end
