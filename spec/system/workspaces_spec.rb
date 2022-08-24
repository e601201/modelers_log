require 'rails_helper'

RSpec.describe "Workspaces", type: :system do
  describe "ログイン前" do
    context "新規登録時" do
      context "正常系" do
        it "メールアドレスとパスワードが入っていると登録できる" do
          visit new_workspace_path
          fill_in "workspace_email", with: "sample@example.com"
          fill_in "workspace_password", with: "Itg43y0G"
          fill_in "workspace_password_confirmation", with: "Itg43y0G"
          click_button "登録する"
          expect(page).to have_content "ワークスペースを作成しました"
          expect(current_path).to have_content root_path
        end
      end
      context "異常系" do
        it "メールアドレスが入っていないと登録できない" do
          visit new_workspace_path
          fill_in "workspace_email", with: nil
          fill_in "workspace_password", with: "Itg43y0G"
          fill_in "workspace_password_confirmation", with: "Itg43y0G"
          click_button "登録する"
          message = page.find_by_id("workspace_email").native.attribute("validationMessage")
          expect(message).to eq "Please fill out this field."
        end
        it "パスワードが入っていないと登録できない" do
          visit new_workspace_path
          fill_in "workspace_email", with: "sample@example.com"
          fill_in "workspace_password", with: nil
          fill_in "workspace_password_confirmation", with: "Itg43y0G"
          click_button "登録する"
          message = page.find_by_id("workspace_password").native.attribute("validationMessage")
          expect(message).to eq "Please fill out this field."
        end
        it "パスワードが8文字未満だと登録できない" do
          visit new_workspace_path
          fill_in "workspace_email", with: "sample@example.com"
          fill_in "workspace_password", with: "1234567"
          fill_in "workspace_password_confirmation", with: "1234567"
          click_button "登録する"
          expect(page).to have_content "パスワードは8文字以上で入力してください"
          expect(current_path).to eq new_workspace_path
        end
      end
    end
  end
  describe "ログイン後" do 
    let(:user) { FactoryBot.create(:workspace) }
    context "解約処理" do
      it "ワークスペースを削除できる" do
        login_as(user)
        find_by_id("avatar-image").click
        click_link "ワークスペース編集画面"
        click_button "ワークスペースの削除"
        expect(page.accept_confirm).to eq "ワークスペースを削除いたします。ユーザー情報等も全て失われますが、よろしいですか？"
        expect(page).to have_content "ワークスペースを削除しました"
      end
    end
  end
end
