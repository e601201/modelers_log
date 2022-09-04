require 'rails_helper'

RSpec.describe SnsInformation, type: :model do
  it " has a valid factory " do
    expect(FactoryBot.build(:sns_information)).to be_valid
    expect(FactoryBot.build(:sns_information, :facebook)).to be_valid
    expect(FactoryBot.build(:sns_information, :instagram)).to be_valid
  end 
end
