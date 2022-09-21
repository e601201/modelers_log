# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  action_type     :integer          not null
#  notifiable_type :string(255)      not null
#  read            :boolean          default("unread"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notifiable_id   :bigint           not null
#  workspace_id    :bigint           not null
#
# Indexes
#
#  index_notifications_on_notifiable    (notifiable_type,notifiable_id)
#  index_notifications_on_workspace_id  (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (workspace_id => workspaces.id)
#
FactoryBot.define do
  factory :notification do
    workspace_id      { FactoryBot.create(:workspace).id }
    read              { "unread" }

    trait :relation do
      action_type { "followed_me" }
      association :notifiable, factory: :relationship
    end

    trait :favorite do
      action_type { "favorit_to_own_project" }
      association :notifiable, factory: :favorite
    end
  end
end
