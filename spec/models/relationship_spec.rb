require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) { FactoryBot.create(:relationship) }
  describe '作成に関してのテスト' do
    context "正常系" do
      it "全てのパラメーターが揃っていれば保存できる" do
        expect(relationship).to be_valid
      end
    end

    context "異常系" do
      it "follower_idがnilの場合は保存できない" do
        relationship.follower_id = nil
        relationship.valid?
        expect(relationship.errors[:follower]).to include("を入力してください")
      end

      it "following_idがnilの場合は保存できない" do
        relationship.following_id = nil
        relationship.valid?
        expect(relationship.errors[:following]).to include("を入力してください")
      end
    end

    context "一意性の検証" do
      before do
        @relation = FactoryBot.create(:relationship)
        @user1 = FactoryBot.build(:relationship)
      end
      it "follower_idとfollowing_idの組み合わせは一意でなければ保存できない" do
        relation2 = FactoryBot.build(:relationship, follower_id: @relation.follower_id, following_id: @relation.following_id)
        relation2.valid?
        expect(relation2.errors[:following_id]).to include("はすでに存在します")
      end

      it "follower_idが同じでもfollowing_idが違うなら保存できる" do
        relation2 = FactoryBot.build(:relationship, follower_id: @relation.follower_id, following_id: @user1.following_id)
        expect(relation2).to be_valid
      end

      it "follower_idが違うならfollowing_idが同じでも保存できる" do
        relation2 = FactoryBot.build(:relationship, follower_id: @user1.follower_id, following_id: @relation.following_id)
        expect(relation2).to be_valid
      end
    end
  end
end
