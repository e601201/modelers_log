# == Schema Information
#
# Table name: projects
#
#  id               :bigint           not null, primary key
#  body             :text(65535)
#  project_category :integer          default("gun_pla"), not null
#  project_image    :string(255)
#  state            :integer          default("in_progress"), not null
#  title            :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  workspace_id     :bigint           not null
#
# Indexes
#
#  index_projects_on_workspace_id  (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (workspace_id => workspaces.id)
#
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
