class Task < ApplicationRecord
  has_one_attached :task_image
  belongs_to :project
  # has_many  :relationships, dependent: :destroy

  enum task_state: { in_progress: 0, done: 5 }

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 255 }
  validates :task_image, images: { purge: true, content_type: %r{\Aimage/(png|jpeg)\Z}, maximum: 524_288_000 }

  scope :image_attached_tasks, -> { select { |a| a.task_image.attached? } }
  scope :recent_in_progress, -> { in_progress.order(created_at: :desc) }
end
