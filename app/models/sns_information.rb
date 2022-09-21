# == Schema Information
#
# Table name: sns_informations
#
#  id           :bigint           not null, primary key
#  sns_account  :string(255)      not null
#  sns_category :integer          default("twitter"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  workspace_id :bigint           not null
#
# Indexes
#
#  index_sns_informations_on_sns_category_and_workspace_id  (sns_category,workspace_id) UNIQUE
#  index_sns_informations_on_workspace_id                   (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (workspace_id => workspaces.id)
#
class SnsInformation < ApplicationRecord
  belongs_to :workspace
  enum sns_category: { twitter: 0, facebook: 5, instagram: 10 }
  validates :sns_category, uniqueness: { scope: :workspace_id }
  validates :sns_category, presence: true
  validates :sns_account, presence: true
end
