class Favorite < ApplicationRecord
  belongs_to :workspace
  belongs_to :project
  has_one :notification, as: :notifiable, dependent: :destroy

  validates :project_id, uniqueness: { scope: :workspace_id }

  def send_notification(project)
    Notification.find_or_create_by!(notifiable: self, workspace_id: project.workspace_id, action_type: 'favorit_to_own_project')
  end
end
