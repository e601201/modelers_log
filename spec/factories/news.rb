# == Schema Information
#
# Table name: news
#
#  id         :bigint           not null, primary key
#  note_url   :string(255)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :news do
    sequence(:title) { |n| "test_#{n}_news_title" }
    note_url  { "test_url" }
  end
end
