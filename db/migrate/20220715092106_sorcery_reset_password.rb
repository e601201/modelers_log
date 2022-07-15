class SorceryResetPassword < ActiveRecord::Migration[7.0]
  def change
    add_column :workspaces, :reset_password_token, :string, default: nil
    add_column :workspaces, :reset_password_token_expires_at, :datetime, default: nil
    add_column :workspaces, :reset_password_email_sent_at, :datetime, default: nil
    add_column :workspaces, :access_count_to_reset_password_page, :integer, default: 0

    add_index :workspaces, :reset_password_token, unique: true
  end
end
