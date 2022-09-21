# == Schema Information
#
# Table name: tasks
#
#  id            :bigint           not null, primary key
#  body          :text(65535)
#  position      :integer
#  task_category :integer          default("assembly"), not null
#  task_image    :string(255)
#  task_state    :integer          default("in_progress"), not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  project_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "test_#{n}_title" }
    body { "test_body" }
    association :project

    trait :in_progress_task do
      task_state { "in_progress" }
    end

    trait :done_task do
      task_state { "done" }
    end

    trait :image_attached_task do
      task_image { Rack::Test::UploadedFile.new("spec/fixtures/files/sample.png") }
    end
  end
end
