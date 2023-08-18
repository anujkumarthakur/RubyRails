# 1. The title, description, and image URL fields aren’t empty.
# 2. The price is a valid number not less than $0.01.
# 3. The title is unique among all products.
# 4. The image URL looks reasonable.

class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  # numericality option to verify that the price is a valid number
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  # allow_blank option to avoid getting multiple error messages when the field is blank.
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\z/i,
    message: 'must be a URL for GIF, PNG or JPG image.'
  }
end
