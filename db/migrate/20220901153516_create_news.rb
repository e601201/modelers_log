class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title, null: false, limit: 255
      t.string :note_url, null: false, limit: 255


      t.timestamps
    end
  end
end
