# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  action_type     :integer          not null
#  notifiable_type :string(255)      not null
#  read            :boolean          default("unread"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notifiable_id   :bigint           not null
#  workspace_id    :bigint           not null
#
# Indexes
#
#  index_notifications_on_notifiable    (notifiable_type,notifiable_id)
#  index_notifications_on_workspace_id  (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (workspace_id => workspaces.id)
#
class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  belongs_to :workspace
  enum action_type: { followings_done_project: 0, favorit_to_own_project: 1, followed_me: 2 }
  enum read: { unread: false, read: true }
  scope :recent, ->(count) { order(created_at: :desc).limit(count) }
end
