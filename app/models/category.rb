class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :articles, -> { order(created_at: :desc) }
end
