FactoryBot.define do
  factory :project do
    sequence(:title) { |n| "test_#{n}_title" }
    body { "test_body" }
    association :workspace

    trait :in_progress_project do
      state { "in_progress" }
    end

    trait :done_project do
      state { "done" }
    end

  end
end
