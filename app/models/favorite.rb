# == Schema Information
#
# Table name: favorites
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  project_id   :bigint           not null
#  workspace_id :bigint           not null
#
# Indexes
#
#  index_favorites_on_project_id                   (project_id)
#  index_favorites_on_workspace_id                 (workspace_id)
#  index_favorites_on_workspace_id_and_project_id  (workspace_id,project_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (workspace_id => workspaces.id)
#
class Favorite < ApplicationRecord
  belongs_to :workspace
  belongs_to :project
  has_one :notification, as: :notifiable, dependent: :destroy

  validates :project_id, uniqueness: { scope: :workspace_id }

  def send_notification(project)
    Notification.find_or_create_by!(notifiable: self, workspace_id: project.workspace_id, action_type: 'favorit_to_own_project')
  end
end
