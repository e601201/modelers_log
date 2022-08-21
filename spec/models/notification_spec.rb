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
