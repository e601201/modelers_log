FactoryBot.define do
  factory :sns_information do
    sns_account { "@test_account" }
    sns_category { 0 }
    association :workspace

    trait :twitter do
      sns_category { 1 }
    end

    trait :facebook do
      sns_category { 2 }
    end

    trait :instagram do
      sns_category { 3 }
    end
  end
end
