class Relationship < ApplicationRecord
  belongs_to :following, class_name: 'Workspace'
  belongs_to :follower, class_name: 'Workspace'
end
