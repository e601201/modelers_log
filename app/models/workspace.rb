class Workspace < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  def received_new_notification?
    #ユーザーが新規通知を受け取ったかどうかをbool値で返すメソッド
  end

  def count_new_notification
    #ユーザーが受け取った未読(checked)の通知をカウントする
  end
end
