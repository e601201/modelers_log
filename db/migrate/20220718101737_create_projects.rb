class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title,  null: false, limit: 255 
      t.text :body,   null: false, limit: 16383
      t.string :image
      t.integer :state, null: false, default: 0
      t.references :workspace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
