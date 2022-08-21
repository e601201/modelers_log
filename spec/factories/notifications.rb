FactoryBot.define do
  factory :notification do
    workspace_id      { FactoryBot.create(:workspace).id }
    read              {"unread"}

    trait :relation do
      action_type { "followed_me" }
      association :notifiable, factory: :relationship
    end

    trait :favorite do
      action_type { "favorit_to_own_project" }
      association :notifiable, factory: :favorite
    end
  end
end
