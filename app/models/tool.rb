class Tool < ApplicationRecord
  belongs_to :workspace
  enum tool_category: { modeling_tool: 0, painting: 10, modeling_materials: 10 }
  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  validates :body, length: { maximum: 50 }
end
