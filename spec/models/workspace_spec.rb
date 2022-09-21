# == Schema Information
#
# Table name: workspaces
#
#  id                                  :bigint           not null, primary key
#  access_count_to_reset_password_page :integer          default(0)
#  crypted_password                    :string(255)
#  email                               :string(255)      not null
#  owner_avatar                        :string(255)
#  owner_comment                       :text(65535)
#  owner_name                          :string(255)
#  reset_password_email_sent_at        :datetime
#  reset_password_token                :string(255)
#  reset_password_token_expires_at     :datetime
#  role                                :integer          default("general"), not null
#  salt                                :string(255)
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_workspaces_on_email                 (email) UNIQUE
#  index_workspaces_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe Workspace, type: :model do

  it "has a valid factory " do
    expect(FactoryBot.build(:workspace)).to be_valid
  end

  it "メールアドレスとパスワードがあれば有効な状態である" do
    user = FactoryBot.build(:workspace)
    expect(user).to be_valid
  end

  it "メールアドレスが入っていなければ無効な状態であること" do
    user = FactoryBot.build(:workspace, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "パスワードが入っていなければ無効な状態であること" do
    user = FactoryBot.build(:workspace, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end 

  it "パスワード確認が入っていなければ無効な状態であること" do
    user = FactoryBot.build(:workspace, password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("を入力してください")
  end 

  it "パスワードが8文字以下なら無効であること" do
    user = FactoryBot.build(:workspace,
      password: "1234567",
      password_confirmation: "1234567"
    )
    user.valid?
    expect(user.errors[:password]).to include("は8文字以上で入力してください")
  end

  it "重複したメールアドレスなら無効な状態であること" do
    FactoryBot.create(:workspace, email: "same_account@example.com")
    user = Workspace.new(
      email: "same_account@example.com",
      password: "DeferentPass",
      password_confirmation: "DeferentPass"
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
  
  it "ユーザーの名前の長さが３０文字を超えると無効な状態であること" do
    user = FactoryBot.build(:workspace,
      owner_name: (0...31).map{ (65 + rand(26)).chr }.join
    )
    user.valid?
    expect(user.errors[:owner_name]).to include("は30文字以内で入力してください")
  end

end
