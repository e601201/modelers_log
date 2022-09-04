class CreateSnsInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :sns_informations do |t|
      t.integer :sns_category,   null: false, default: 0
      t.string :sns_account,     null: false
      t.references :workspace,   null: false, foreign_key: true

      t.timestamps
    end
    add_index :sns_informations, [:sns_category, :workspace_id], unique: true
  end
end
