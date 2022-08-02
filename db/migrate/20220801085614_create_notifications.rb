class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :notifiable, polymorphic: true, null: false
      t.references :workspace, null: false, foreign_key: true
      t.integer :action_type, null: false
      t.boolean :read, null: false, default:false

      t.timestamps
    end
  end
end
