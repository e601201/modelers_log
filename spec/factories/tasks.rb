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
