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
FactoryBot.define do
  factory :sns_information do
    sns_account { "@test_account" }
    sns_category { 0 }
    association :workspace

    trait :facebook do
      sns_category { 5 }
    end

    trait :instagram do
      sns_category { 10 }
    end
  end
end
