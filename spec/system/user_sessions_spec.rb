require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let(:user) { FactoryBot.create(:workspace) }

  describe "ログイン前" do
    context "正常系" do
      it "emailとパスワードが正しければログインに成功する" do
        visit login_path
        fill_in "email", with: user.email
        fill_in "password", with: "Itg43y0G"
        click_button "ログイン"
        expect(page).to have_content "ログインしました！！"
        expect(current_path).to eq root_path
      end
    end
    context "異常系" do
      it "フォームが空欄の場合は失敗する" do
        visit login_path
        fill_in "email", with: nil
        fill_in "password", with: nil
        click_button "ログイン"
        expect(page).to have_content "ログインに失敗しました"
        expect(current_path).to eq login_path
      end
      it "フォームに登録した文字とは異なる文字を入力した場合は失敗する" do
        visit login_path
        fill_in "email", with: "deferent_account@example.com"
        fill_in "password", with: "deferent_pass"
        click_button "ログイン"
        expect(page).to have_content "ログインに失敗しました"
        expect(current_path).to eq login_path
      end
    end
  end
  describe "ログイン後" do
    context "ログアウト処理" do
      it "ログアウトボタンを押すとログアウトできる" do
        login_as(user)
        expect(page).to have_content "ログインしました！！"
      end
    end
  end
end
