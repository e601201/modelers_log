class News < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :note_url, presence: true, length: { maximum: 255 }
end
