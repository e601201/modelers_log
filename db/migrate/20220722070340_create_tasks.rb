class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title,  null: false, limit: 255
      t.text :body,   null: false, limit: 16383
      t.string :task_image
      t.integer :usage_time, null: false, default: 30
      t.integer :task_state, null: false, default: 0
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
