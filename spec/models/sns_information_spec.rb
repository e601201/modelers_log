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
require 'rails_helper'

RSpec.describe SnsInformation, type: :model do
  it " has a valid factory " do
    expect(FactoryBot.build(:sns_information)).to be_valid
    expect(FactoryBot.build(:sns_information, :facebook)).to be_valid
    expect(FactoryBot.build(:sns_information, :instagram)).to be_valid
  end 
end
