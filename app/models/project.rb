# == Schema Information
#
# Table name: projects
#
#  id               :bigint           not null, primary key
#  body             :text(65535)
#  project_category :integer          default("gun_pla"), not null
#  project_image    :string(255)
#  state            :integer          default("in_progress"), not null
#  title            :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  workspace_id     :bigint           not null
#
# Indexes
#
#  index_projects_on_workspace_id  (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (workspace_id => workspaces.id)
#
class Project < ApplicationRecord
  has_one_attached :project_image
  belongs_to :workspace
  has_many :tasks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :workspace

  enum state: { in_progress: 0, done: 5 }
  enum project_category: { gun_pla: 0, charactor: 1, car: 2, bike: 3, battle_tank: 4, airplane: 5, buildings: 6, other: 10 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 65_535 }
  validates :project_image, images: { purge: true, content_type: %r{\Aimage/(png|jpeg)\Z}, maximum: 5_242_880 }
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
