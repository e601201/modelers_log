FactoryBot.define do
  factory :relationship do
    following_id    { FactoryBot.create(:workspace).id }
    follower_id    { FactoryBot.create(:workspace).id }
  end
end
