class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :workspace, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorites, [:workspace_id, :project_id], unique: true
  end
end
