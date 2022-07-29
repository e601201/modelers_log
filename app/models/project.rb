class Project < ApplicationRecord
  has_one_attached :project_image
  belongs_to :workspace
  has_many :tasks, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :project_tags, dependent: :destroy
  # has_many :notifications, dependent: :destroy

  enum state: { in_progress: 0, done: 5, published: 10 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  validates :project_image, images: { purge: true, content_type: %r{\Aimage/(png|jpeg)\Z}, maximum: 524_288_000 }

  scope :recent_dones, -> { done.order(created_at: :desc) }
  scope :recent_published, -> { published.order(created_at: :desc) }

  def restore_tasks_state
    tasks.map(&:in_progress!)
  end
end
