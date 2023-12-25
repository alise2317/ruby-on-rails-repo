class Favorites < ApplicationRecord
  validates :img_url, presence: true
  validates :description, presence: true, length: { maximum: 255 }
end
