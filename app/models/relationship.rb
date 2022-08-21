class Relationship < ApplicationRecord
  belongs_to :following, class_name: 'Workspace'
  belongs_to :follower, class_name: 'Workspace'
  has_one :notification, as: :notifiable, dependent: :destroy

  validates :following_id, presence: true, uniqueness: { scope: :follower_id }
  validates :follower_id, presence: true
end
