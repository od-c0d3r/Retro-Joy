class Article < ApplicationRecord
    validates :catergory_id,  presence: true

    has_one_attached :image

    belongs_to :author, class_name: 'User'
    
    has_many :votes
    has_many :liked_users, through: 'votes'

    belongs_to :category
end
