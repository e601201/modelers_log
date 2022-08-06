class Project < ApplicationRecord
  has_one_attached :project_image
  belongs_to :workspace
  has_many :tasks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :workspace
  # has_many :project_tags, dependent: :destroy
  # has_many :notifications, dependent: :destroy

  enum state: { in_progress: 0, done: 5, published: 10 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
  validates :project_image, images: { purge: true, content_type: %r{\Aimage/(png|jpeg)\Z}, maximum: 524_288_000 }
  scope :image_attached_projects, ->(count) { select { |a| a.project_image.attached? }.sample(count) }
  scope :recent_in_progress, ->(count) { in_progress.order(created_at: :desc).limit(count) }
  scope :recent_done, ->(count) { done.order(created_at: :desc).limit(count) }
  scope :recent_published, ->(count) { published.order(created_at: :desc).limit(count) }
  scope :sort_by_favorites_size, -> { includes(:favorited_users).sort { |a, b| b.favorited_users.size <=> a.favorited_users.size } }
  def restore_all_state
    in_progress!
    tasks.map(&:in_progress!)
  end

  def change_state
    if in_progress?
      done!
    else
      in_progress!
    end
  end
end
