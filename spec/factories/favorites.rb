FactoryBot.define do
  factory :favorite do
    workspace_id { FactoryBot.create(:workspace).id }
    project_id   { FactoryBot.create(:project).id }
  end
end