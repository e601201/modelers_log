require 'rails_helper'

RSpec.describe "workspaces/index", type: :view do
  before(:each) do
    assign(:workspaces, [
      Workspace.create!(
        email: "Email",
        crypted_password: "Crypted Password",
        salt: "Salt"
      ),
      Workspace.create!(
        email: "Email",
        crypted_password: "Crypted Password",
        salt: "Salt"
      )
    ])
  end

  it "renders a list of workspaces" do
    render
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Crypted Password".to_s, count: 2
    assert_select "tr>td", text: "Salt".to_s, count: 2
  end
end
