# == Schema Information
#
# Table name: workspaces
#
#  id                                  :bigint           not null, primary key
#  access_count_to_reset_password_page :integer          default(0)
#  crypted_password                    :string(255)
#  email                               :string(255)      not null
#  owner_avatar                        :string(255)
#  owner_comment                       :text(65535)
#  owner_name                          :string(255)
#  reset_password_email_sent_at        :datetime
#  reset_password_token                :string(255)
#  reset_password_token_expires_at     :datetime
#  role                                :integer          default("general"), not null
#  salt                                :string(255)
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_workspaces_on_email                 (email) UNIQUE
#  index_workspaces_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :workspace, aliases: [:user] do
    sequence(:email) { |n| "test_user_#{n}@example.com" }
    password { "Itg43y0G" }
    password_confirmation { "Itg43y0G" }
  end
end
