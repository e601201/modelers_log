class Workspace < ApplicationRecord
  authenticates_with_sorcery!
  # mount_uploader :avatar, AvatarUploader
  # has_many  :projects, dependent: :destroy
  # has_many  :relationships, dependent: :destroy
  # has_many  :sns_informations, dependent: :destroy
  # has_many  :notifications, dependent: :destroy
  # has_many  :received_nnotifications, dependent: :destroy
  # has_many  :own_toolsets, through: :workspace_toolsets, source: :toolset

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true

  def received_new_notification?
    # ユーザーが新規通知を受け取ったかどうかをbool値で返すメソッド
  end
  
  def count_new_notification
    # ユーザーが受け取った未読(checked)の通知をカウントする
  end
end
