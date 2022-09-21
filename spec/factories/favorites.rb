# == Schema Information
#
# Table name: favorites
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  project_id   :bigint           not null
#  workspace_id :bigint           not null
#
# Indexes
#
#  index_favorites_on_project_id                   (project_id)
#  index_favorites_on_workspace_id                 (workspace_id)
#  index_favorites_on_workspace_id_and_project_id  (workspace_id,project_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (workspace_id => workspaces.id)
#
FactoryBot.define do
  factory :favorite do
    workspace_id { FactoryBot.create(:workspace).id }
    project_id   { FactoryBot.create(:project).id }
  end
end
