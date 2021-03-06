class Relationship < ApplicationRecord
  belongs_to :following, class_name: 'Workspace'
  belongs_to :follower, class_name: 'Workspace'

  validates :following_id, uniqueness: { scope: :follower_id }
end
