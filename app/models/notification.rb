class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  belongs_to :workspace
  enum action_type: { followings_done_project: 0, favorit_to_own_project: 1, followed_me: 2 }
  enum read: { unread: false, read: true }
  scope :recent, ->(count) { order(created_at: :desc).limit(count) }
end
