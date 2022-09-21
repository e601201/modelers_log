# == Schema Information
#
# Table name: tasks
#
#  id            :bigint           not null, primary key
#  body          :text(65535)
#  position      :integer
#  task_category :integer          default("assembly"), not null
#  task_image    :string(255)
#  task_state    :integer          default("in_progress"), not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  project_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory " do
    expect(FactoryBot.build(:task)).to be_valid
    expect(FactoryBot.build(:task, :in_progress_task)).to be_valid
    expect(FactoryBot.build(:task, :done_task)).to be_valid
    expect(FactoryBot.build(:task, :image_attached_task)).to be_valid
  end

  describe "バリデーションに関してのテスト" do
    it "本文が255文字を超えると無効" do
      task = FactoryBot.build(:task,
        body: (0...256).map{ (65 + rand(26)).chr }.join
      )
      task.valid?
      expect(task.errors[:body]).to include("は255文字以内で入力してください")
    end
    it "画像のフォーマットがjpeg,png以外だと無効な状態である" do
      task = FactoryBot.build(:task,
        task_image: fixture_file_upload("sample.txt")
      )
      task.valid?
      expect(task.errors[:task_image]).to include("はサポートされていないフォーマットです")
    end
    it "画像のbyte_sizeが5_242_880byteを超えると無効な状態である" do
      task = FactoryBot.build(:task,
        task_image: fixture_file_upload("10MB.png")
      )
      task.valid?
      expect(task.errors[:task_image]).to include("は5MB以下の画像にしてください")
    end
  end

  describe "プロジェクトの並べ方に関してのテスト" do
    before do
      @image_attached_task = FactoryBot.create(:task, :image_attached_task)
      @task = FactoryBot.create(:task)
      @recentry_task = FactoryBot.create(:task)
    end
    it "画像の入った画像のみ並べる" do
      @image_attached_tasks = Task.all.image_attached_tasks
      expect(@image_attached_tasks.size).to eq 1
    end
    context "task未完了のものを最新のものから順に並べる" do
      before do
        @tasks = Task.all.recent_in_progress
      end
      it "task全ての配列数を返す" do
        expect(@tasks.size).to eq 3
      end 
      it "配列の最初は最後に作られたタスク" do
        expect(@tasks.first).to eq @recentry_task
      end
    end
  end

  describe "プロジェクトのステートに関してのテスト" do
    before do
      @in_progress_task = FactoryBot.create(:task, :in_progress_task)
      @done_task = FactoryBot.create(:task, :done_task)
    end
    context "taskのstateを変更する" do
      before do
        @in_progress_task.change_state
      end
      it "taskがin_progressならdoneにする" do 
        expect(@in_progress_task.task_state).to eq "done"
      end
    end
  end

end
