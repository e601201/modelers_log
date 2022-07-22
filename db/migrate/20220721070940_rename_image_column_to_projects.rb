class RenameImageColumnToProjects < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :image, :project_image
  end
end
