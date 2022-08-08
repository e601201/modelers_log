require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        title: "Title",
        body: "MyText",
        task_image: "Task Image",
        task_state: 3,
        project: nil
      ),
      Task.create!(
        title: "Title",
        body: "MyText",
        task_image: "Task Image",
        task_state: 3,
        project: nil
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Task Image".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
