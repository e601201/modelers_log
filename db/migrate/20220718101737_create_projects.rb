class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title,  null: false, limit: 255 
      t.text :body,   limit: 16383
      t.integer :project_category, null: false, default: 0
      t.string :project_image
      t.integer :state, null: false, default: 0
      t.references :workspace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
