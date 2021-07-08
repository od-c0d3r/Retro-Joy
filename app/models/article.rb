class Article < ApplicationRecord
    validates :category_id, presence: true
    validates :image,       content_type: { in:        %w[image/jpeg image/gif image/png],
                                            message:   "must be a valid image format" },
                            size:         { less_than: 5.megabytes,
                                            message:   "should be less than 5MB" }

    has_one_attached :image
    before_save do
        if self.image.attached?
            ext = '.' + self.image.blob.filename.extension
            self.image.blob.update(filename: "#{Time.now.to_i}" + ext)
        end
    end

    belongs_to :author, class_name: 'User'
    
    has_many :votes
    has_many :liked_users, through: :votes, source: :user

    belongs_to :category
end
