FactoryBot.define do
  factory :news do
    sequence(:title) { |n| "test_#{n}_news_title" }
    note_url  { "test_url" }
  end
end
