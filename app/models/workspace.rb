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
class Workspace < ApplicationRecord
  authenticates_with_sorcery!
  has_one_attached :owner_avatar
  has_many :projects, dependent: :destroy
  has_many :relationships, foreign_key: :following_id, dependent: :destroy, inverse_of: :following
  has_many :followings, through: :relationships, source: :follower
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy, inverse_of: :follower
  has_many :followers, through: :reverse_of_relationships, source: :following
  has_many :favorites, dependent: :destroy
  has_many :favorite_projects, through: :favorites, source: :project
  has_many :sns_informations, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :tools, dependent: :destroy
  # has_many :like_tools, through: :like_tools, source: :tool

  enum role: { general: 0, guest: 5, admin: 10 }
  validates :password, presence: true
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, presence: true, uniqueness: true
  validates :owner_name, length: { maximum: 30 }
  validates :owner_avatar, images: { purge: true, content_type: %r{\Aimage/(png|jpeg)\Z}, maximum: 524_288_000 }

  # maybe_no_need
  def own_workspace?(workspace)
    self == workspace
  end

  def own_project?(project)
    id == project.workspace_id
  end

  def send_notification(workspace)
    Notification.find_or_create_by!(notifiable: workspace, workspace_id: workspace.follower_id, action_type: 'followed_me')
  end

  def unread_notifications
    notifications.select(&:unread?)
  end

  def follow(workspace)
    relationships.create!(follower_id: workspace.id)
  end

  def unfollow(workspace)
    followings.destroy(workspace)
  end

  def follow?(workspace)
    workspace.followers.pluck(:id).include?(id)
  end

  def favorite(project)
    favorites.create!(project_id: project.id)
  end

  def unfavorite(project)
    favorite_projects.destroy(project)
  end

  def favorite?(project)
    project.favorites.pluck(:workspace_id).include?(id)
  end
end
