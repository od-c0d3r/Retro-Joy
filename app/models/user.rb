class User < ApplicationRecord
  before_save :downcase_email

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: true

  has_many :articles, foreign_key: 'author_id'

  has_many :votes
  has_many :liked_articles, through: :votes, source: :article

  private

  def downcase_email
    self.email = email.downcase
  end
end
