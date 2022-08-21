FactoryBot.define do
  factory :workspace, aliases: [:user] do
    sequence(:email) { |n| "test_user_#{n}@example.com" }
    password { "Itg43y0G" }
    password_confirmation { "Itg43y0G" }
  end
end
