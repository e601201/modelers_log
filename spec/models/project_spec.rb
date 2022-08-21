require 'rails_helper'

RSpec.describe Project, type: :model do
  it "has a valid factory " do
    expect(FactoryBot.build(:project)).to be_valid
    expect(FactoryBot.build(:project, :in_progress_project)).to be_valid
    expect(FactoryBot.build(:project, :done_project)).to be_valid
  end
  before do
    @user_01 = Workspace.create(
      email: "daichi@example.com",
      password: "DaichiNagata",
      password_confirmation: "DaichiNagata"
    )
    @user_02 = Workspace.create(
      email: "test_02@example.com",
      password: "DaichiNagata",
      password_confirmation: "DaichiNagata"
    )
    @done_project1 = @user_01.projects.create(
      title: "test_01",
      state: "done",
    )
    @in_progress_project2 = @user_01.projects.create(
      title: "test_02",
      state: "in_progress"
    )
    @in_progress_project3 = @user_01.projects.create(
      title: "test_03",
      state: "in_progress"
    )
  end
  describe "バリデーションに関してのテスト" do
    it "タイトル(255文字以内)があれば有効な状態" do
      expect(FactoryBot.build(:project)).to be_valid
    end

    it "タイトルが入っていなければ無効な状態であること" do
      project = FactoryBot.build(:project, title: nil)
      project.valid?
      expect(project.errors[:title]).to include("を入力してください")
    end

    it "タイトルが255文字を超えると無効な状態であること" do
      project = FactoryBot.build(:project,
        title: (0...256).map{ (65 + rand(26)).chr }.join)
      project.valid?
      expect(project.errors[:title]).to include("は255文字以内で入力してください")
    end

    it "本文が65535文字を超えると無効な状態であることこと" do
      project = FactoryBot.build(:project,
        body: (0...65536).map{ (65 + rand(26)).chr }.join)
      project.valid?
      expect(project.errors[:body]).to include("は65535文字以内で入力してください")
    end

    it "画像のフォーマットがjpeg,png以外だと無効な状態である" do
      project = FactoryBot.build(:project,
        project_image: fixture_file_upload("sample.txt")
      )
      project.valid?
      expect(project.errors[:project_image]).to include("はサポートされていないフォーマットです")
    end
    it "画像のbyte_sizeが5_242_880を超えると無効な状態である" do
      project = FactoryBot.build(:project,
        project_image: fixture_file_upload("10MB.png")
      )
      project.valid?
      expect(project.errors[:project_image]).to include("は5MB以下の画像にしてください")
    end
  end
  describe "プロジェクトの並べ方に関してのテスト" do
    context "全ての作品に対しての並べ方" do
      before do
        @project_1 = @user_02.projects.create(
          title: "test_01",
          state: "in_progress"
        )
        @recentry_in_project = @user_02.projects.create(
          title: "recentry_in_project",
          state: "in_progress"
        )
      end
      it "未完成プロジェクトを最新順に全て返す" do
        projects = Project.all.recent_in_progress(5)
        expect(projects.size).to eq 4 
        expect(projects.first).to eq(@recentry_in_project)
      end
      it "完成のプロジェクトを最新順に全て返す" do
        projects = Project.all.recent_done(5)
        expect(projects.size).to eq 1
        expect(projects.first).to eq(@done_project1)
      end
      it "画像がアタッチされているプロジェクトのみを並べる" do
        @picture_attached_project = @user_02.projects.create(
        title: "recentry_in_project",
        project_image: fixture_file_upload("sample.png")
        )
        sleep(0.1)
        projects = Project.all.image_attached_projects(5)
        expect(projects.size).to eq 1
        expect(projects.first).to eq(@picture_attached_project)
      end
    end
    context "任意のユーザーの作品群に対しての並べ方" do
      it "未完成プロジェクトを最新順に全て返す" do
        projects = @user_01.projects.recent_in_progress(3)
        expect(projects.size).to eq 2
        expect(projects.first).to eq(@in_progress_project3)
      end
      it "完成のプロジェクトを最新順に全て返す" do
        projects = @user_01.projects.recent_done(5)
        expect(projects.size).to eq 1
        expect(projects.first).to eq(@done_project1)
      end
    end
  end
  describe "プロジェクトのステートに関してのテスト" do
    context "プロジェクトのステートを変更する" do
      it "doneのステートをin_progressにする" do
        @done_project1.change_state
        expect(@done_project1.state).to eq("in_progress")
      end
      it "in_progressのステートをdoneにする" do
        @in_progress_project2.change_state
        expect(@in_progress_project2.state).to eq("done")
      end
    end
  end
end
