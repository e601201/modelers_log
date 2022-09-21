# == Schema Information
#
# Table name: tools
#
#  id            :bigint           not null, primary key
#  body          :text(65535)
#  name          :string(255)      not null
#  tool_category :integer          default("modeling_tool"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  workspace_id  :bigint           not null
#
# Indexes
#
#  index_tools_on_workspace_id  (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (workspace_id => workspaces.id)
#
class Tool < ApplicationRecord
  belongs_to :workspace
  enum tool_category: { modeling_tool: 0, painting: 10, finishing: 20, modeling_material: 30, other: 40 }
  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  validates :body, length: { maximum: 100 }
end
