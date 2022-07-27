class Workspace < ApplicationRecord
  authenticates_with_sorcery!
  has_one_attached :owner_avatar
  has_many :projects, dependent: :destroy
  has_many :relationships, foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :following
  # has_many  :sns_informations, dependent: :destroy
  # has_many  :notifications, dependent: :destroy
  # has_many  :received_notifications, dependent: :destroy
  # has_many  :own_toolsets, through: :workspace_toolsets, source: :toolset

  enum role: { general: 0, guest: 5, admin: 10 }
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true
  validates :owner_name, length: { maximum: 30 }
  validates :owner_avatar, images: { purge: true, content_type: %r{\Aimage/(png|jpeg)\Z}, maximum: 524_288_000 }

  def own_workspace?(workspace) #いらないかも
    self == workspace
  end

  def own_project?(project)
    id == project.workspace_id
  end

  def received_new_notification?
    # ユーザーが新規通知を受け取ったかどうかをbool値で返すメソッド
  end

  def count_new_notification
    # ユーザーが受け取った未読(checked)の通知をカウントする
  end

  def follow?(workspace)
    workspace.followers.pluck(:id).include?(id)
  end
end
