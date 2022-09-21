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
require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:relationship_note) { FactoryBot.create(:notification, :relation) }
  let(:favorite_note) { FactoryBot.create(:notification, :favorite) }
  describe "#create" do
    context "relationship 正常系" do
      it "全てのパラメーターが揃っていれば保存できる" do
        expect(relationship_note).to be_valid
      end
    end
    context "relationship 異常系" do
    end
    context "favorite 正常系" do
      it "全てのパラメーターが揃っていれば保存できる" do
        expect(favorite_note).to be_valid
      end
    end
    context "favorite 異常" do
    end
  end
end
