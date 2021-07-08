class User < ApplicationRecord
    before_save   :downcase_email

    validates :username,  presence: true, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true

    has_many :articles, foreign_key: "author_id"

    has_many :votes
    has_many :liked_articles, through: :votes
    
    private

        def downcase_email
            self.email = email.downcase
        end
end
