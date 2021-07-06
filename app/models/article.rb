class Article < ApplicationRecord
    has_one_attached :image

    belongs_to :author, class_name: 'User'

end
