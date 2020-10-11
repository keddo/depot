class Product < ApplicationRecord
    validates :title, :image_url, :description, presence: true
    validates :title, uniqueness: true, length: { minimum: 10, message: 'title should be at least 5 chars' }

    validates :image_url, allow_blank: true, format: {
                with: %r{\.(gif|jpg|png)\z}i,
                message: 'must be a URL for GIF, JPG or PNG image.'
                }
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end
