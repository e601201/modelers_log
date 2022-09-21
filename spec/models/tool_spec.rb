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
require 'rails_helper'

RSpec.describe Tool, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
