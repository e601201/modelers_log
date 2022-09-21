# == Schema Information
#
# Table name: news
#
#  id         :bigint           not null, primary key
#  note_url   :string(255)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe News, type: :model do
  let(:news) { FactoryBot.create(:news) }
  describe "#create" do
    context "正常系" do
      it "全てのパラメーターが揃っていれば保存できる" do
        expect(news).to be_valid
      end
    end
    context "異常系" do
      it "タイトルが入っていないと登録できない" do
        news = FactoryBot.build(:news, title: nil)
        news.valid?
        expect(news.errors[:title]).to include("を入力してください")
      end
      it "タイトルが入っていないと登録できない" do
        news = FactoryBot.build(:news, note_url: nil)
        news.valid?
        expect(news.errors[:note_url]).to include("を入力してください")
      end
    end
  end
end
