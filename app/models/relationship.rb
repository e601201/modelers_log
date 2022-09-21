# == Schema Information
#
# Table name: relationships
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  follower_id  :integer          not null
#  following_id :integer          not null
#
# Indexes
#
#  index_relationships_on_follower_id                   (follower_id)
#  index_relationships_on_following_id                  (following_id)
#  index_relationships_on_following_id_and_follower_id  (following_id,follower_id) UNIQUE
#
class Relationship < ApplicationRecord
  belongs_to :following, class_name: 'Workspace'
  belongs_to :follower, class_name: 'Workspace'
  has_one :notification, as: :notifiable, dependent: :destroy

  validates :following_id, uniqueness: { scope: :follower_id }
end
