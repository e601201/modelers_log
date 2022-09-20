FactoryBot.define do
  factory :tool do
    tool_category { 0 }
    name { "my_tool" }
    body { "my_tool_text" }
    association :workspace
  end
end
