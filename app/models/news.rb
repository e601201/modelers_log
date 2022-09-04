class News < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :note_url, presence: true, length: { maximum: 255 }
  scope :recent, -> { order(created_at: :desc) }
  scope :latest_news_of_this_week, -> { recent.where(created_at: Date.current.all_week(:sunday)) }
end
