require 'rails_helper'

RSpec.describe "Projects", type: :system do
  let(:user) { FactoryBot.create(:workspace) }
  let(:project) { FactoryBot.create(:project, workspace: user) }
  describe "ログイン前" do
    it "新しいプロジェクが作れない" do
      visit "/projects/new"
      expect(page).to have_content "ログインしてください"
      expect(current_path).to eq login_path
    end
  end
  describe "ログイン後" do
    before { login_as(user) }
    context "自分のワークスペース内にて" do
      it "自分のプロジェクト一覧が閲覧可能" do
        click_link "あなたのプロジェクト"
        expect(current_path).to eq "/workspaces/#{user.id}"
      end
      context "自分のプロジェクトに対して" do
        it "新しいプロジェクトを作成できる" do
          find(".btn.btn-outline.btn-secondary").click
          click_link "+ ベーシック"
          expect(page.accept_confirm).to eq "プロジェクトの新規作成を行います"
          expect(page).to have_content "新規プロジェクト"
          fill_in "project_title", with:"test_title"
          click_button "登録する"
          expect(page).to have_content "プロジェクトを作成しました"
        end
        it "テンプレートを利用できる" do
          find(".btn.btn-outline.btn-secondary").click
          click_link "+ 組み立てのみ"
          expect(page.accept_confirm).to eq "ガンプラ（素組み）のテンプレートを使用してプロジェクトを作成します"
          expect(page).to have_content "組立テンプレ_タイトル"
          expect(user.projects.first.title).to eq "組立テンプレ_タイトル"
        end
        it "自分のプロジェクトは更新できる" do
          project = FactoryBot.create(:project, workspace: user)
          visit project_path(project.id)
          find(".btn.btn-info").click
          expect(page).to have_content "プロジェクト編集画面"
          click_button "更新する"
          expect(page).to have_content "プロジェクトを更新しました"
        end
        it "自分のプロジェクトは複製できる" do
          project = FactoryBot.create(:project, workspace: user)
          visit project_path(project.id)
          expect {
            find(".btn.btn-accent").click
            expect(page.accept_confirm).to eq "プロジェクトを複製してもよろしいですか？"
            expect(page).to have_content "プロジェクトを複製しました"
          } . to change(user.projects, :count).by(+1)
          expect(user.projects.last.title).to eq "test_2_title_clone"
        end
        it "自分のプロジェクトは削除できる" do
          project = FactoryBot.create(:project, workspace: user)
          visit project_path(project.id)
          expect {
          find(".btn.btn-warning").click
          expect(page.accept_confirm).to eq "プロジェクトを削除してもよろしいですか？"
          expect(page).to have_content "プロジェクトを削除しました"
          } . to change(user.projects, :count).by(-1)
        end
        context "タスクを消化したプロジェクトに対して" do
          it "プロジェクトを完成状態にすることができる" do
          visit project_path(project.id)
          find(".btn.btn-warning").click
          expect(page.accept_confirm).to eq "プロジェクトを削除してもよろしいですか？"
          expect(page).to have_content "プロジェクトを削除しました"
          end
          it "完成させたプロジェクトを未完成状態に戻すことができる" do
          end
        end
      end
    end
    context "他人のワークスペース内にて" do
      let(:another_user) { FactoryBot.create(:workspace) }
      let(:another_project) { FactoryBot.create(:project, workspace: another_user) }
      it "他人のprojectは編集できない" do
        visit edit_project_path(another_project.id)
        expect(page).to have_content "それを行う権限がありません"
      end
    end
  end
end