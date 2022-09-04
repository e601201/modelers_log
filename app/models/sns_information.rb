class SnsInformation < ApplicationRecord
  belongs_to :workspace
  enum sns_category: { twitter: 0, facebook: 5, instagram: 10 }
  validates :sns_category, uniqueness: { scope: :workspace_id }
  validates :sns_category, presence: true
  validates :sns_account, presence: true
end
