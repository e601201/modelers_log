# == Schema Information
#
# Table name: tasks
#
#  id            :bigint           not null, primary key
#  body          :text(65535)
#  position      :integer
#  task_category :integer          default("assembly"), not null
#  task_image    :string(255)
#  task_state    :integer          default("in_progress"), not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  project_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Task < ApplicationRecord
  has_one_attached :task_image
  belongs_to :project
  acts_as_list scope: :project

  enum task_state: { in_progress: 0, done: 5 }
  enum task_category: { assembly: 0, surface: 1, painting: 2, photography: 3, other: 4 }

  validates :title, presence: true
  validates :body, length: { maximum: 255 }
  validates :task_image, images: { purge: true, content_type: %r{\Aimage/(png|jpeg)\Z}, maximum: 5_242_880 }

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
