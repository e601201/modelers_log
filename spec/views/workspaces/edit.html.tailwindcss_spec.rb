require 'rails_helper'

RSpec.describe "workspaces/edit", type: :view do
  before(:each) do
    @workspace = assign(:workspace, Workspace.create!(
      email: "MyString",
      crypted_password: "MyString",
      salt: "MyString"
    ))
  end

  it "renders the edit workspace form" do
    render

    assert_select "form[action=?][method=?]", workspace_path(@workspace), "post" do

      assert_select "input[name=?]", "workspace[email]"

      assert_select "input[name=?]", "workspace[crypted_password]"

      assert_select "input[name=?]", "workspace[salt]"
    end
  end
end
