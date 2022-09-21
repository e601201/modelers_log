# == Schema Information
#
# Table name: news
#
#  id         :bigint           not null, primary key
#  note_url   :string(255)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class News < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :note_url, presence: true, length: { maximum: 255 }
  scope :recent, -> { order(created_at: :desc) }
  scope :latest_news_of_this_week, -> { recent.where(created_at: Date.current.all_week(:sunday)) }
end
