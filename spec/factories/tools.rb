FactoryBot.define do
  factory :tool do
    tool_category { 0 }
    name { "MyString" }
    text { "Mystring" }
    workspace { nil }
  end
end
