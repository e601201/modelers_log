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
