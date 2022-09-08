class Tool < ApplicationRecord
  belongs_to :workspace
  enum tool_category: { modeling_tool: 0, painting: 10, finishing: 20, modeling_material: 30, other: 40 }
  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  validates :body, length: { maximum: 100 }
end
