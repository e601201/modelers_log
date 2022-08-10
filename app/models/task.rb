class Task < ApplicationRecord
  has_one_attached :task_image
  belongs_to :project
  acts_as_list scope: :project

  enum task_state: { in_progress: 0, done: 5 }
  enum task_category: { assembly: 0, surface: 1, painting: 2, photography: 3, other: 4 }

  validates :title, presence: true
  validates :body, length: { maximum: 255 }
  validates :task_image, images: { purge: true, content_type: %r{\Aimage/(png|jpeg)\Z}, maximum: 524_288_000 }

  scope :image_attached_tasks, -> { select { |a| a.task_image.attached? } }
  scope :recent_in_progress, -> { in_progress.order(created_at: :desc) }

  def change_state
    if in_progress?
      done!
    else
      in_progress!
    end
  end
end
