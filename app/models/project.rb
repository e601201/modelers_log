class Project < ApplicationRecord
  has_one_attached :project_image
  belongs_to :workspace
  has_many :tasks, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :project_tags, dependent: :destroy
  # has_many :notifications, dependent: :destroy

  enum state: { in_progress: 0, published: 5, publish_wait: 10 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  validates :project_image, images: { purge: true, content_type: %r{\Aimage/(png|jpeg)\Z}, maximum: 524_288_000 }
end
