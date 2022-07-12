require 'rails_helper'

RSpec.describe "workspaces/new", type: :view do
  before(:each) do
    assign(:workspace, Workspace.new(
      email: "MyString",
      crypted_password: "MyString",
      salt: "MyString"
    ))
  end

  it "renders new workspace form" do
    render

    assert_select "form[action=?][method=?]", workspaces_path, "post" do

      assert_select "input[name=?]", "workspace[email]"

      assert_select "input[name=?]", "workspace[crypted_password]"

      assert_select "input[name=?]", "workspace[salt]"
    end
  end
end
