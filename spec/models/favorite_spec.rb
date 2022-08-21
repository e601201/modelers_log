require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { FactoryBot.create(:favorite) }
  describe '作成に関してのテスト' do
    context "正常系" do
      it "全てのパラメーターが揃っていれば保存できる" do
        expect(favorite).to be_valid
      end
    end

    context "異常系" do
      fit "workspace_idがnilの場合は保存できない" do
        favorite.workspace_id = nil
        favorite.valid?
        expect(favorite.errors[:workspace]).to include("を入力してください")
      end

      it "project_idがnilの場合は保存できない" do
        favorite.project_id = nil
        favorite.valid?
        expect(favorite.errors[:project]).to include("を入力してください")
      end
    end

    context "一意性の検証" do
      before do
        @relation = FactoryBot.create(:favorite)
        @user1 = FactoryBot.build(:favorite)
      end
      it "workspace_idとproject_idの組み合わせは一意でなければ保存できない" do
        relation2 = FactoryBot.build(:favorite, workspace_id: @relation.workspace_id, project_id: @relation.project_id)
        relation2.valid?
        expect(relation2.errors[:project_id]).to include("はすでに存在します")
      end

      it "workspace_idが同じでもproject_idが違うなら保存できる" do
        relation2 = FactoryBot.build(:favorite, workspace_id: @relation.workspace_id, project_id: @user1.project_id)
        expect(relation2).to be_valid
      end

      it "workspace_idが違うならproject_idが同じでも保存できる" do
        relation2 = FactoryBot.build(:favorite, workspace_id: @user1.workspace_id, project_id: @relation.project_id)
        expect(relation2).to be_valid
      end
    end
  end
end
