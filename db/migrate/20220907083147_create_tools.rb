class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.integer :tool_category,  null: false, default: 0
      t.string :name,            null: false, limit: 255
      t.text :body,              limit: 16383
      t.references :workspace,   null: false, foreign_key: true

      t.timestamps
    end
  end
end
