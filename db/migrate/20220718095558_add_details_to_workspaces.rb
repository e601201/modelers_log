class AddDetailsToWorkspaces < ActiveRecord::Migration[7.0]
  def change
    add_column :workspaces, :owner_name, :string
    add_column :workspaces, :owner_avatar, :string
    add_column :workspaces, :role, :integer, null: false, default: 0
  end
end
