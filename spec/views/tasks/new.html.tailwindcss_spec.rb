require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      title: "MyString",
      body: "MyText",
      task_image: "MyString",
      task_state: 1,
      project: nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[title]"

      assert_select "textarea[name=?]", "task[body]"

      assert_select "input[name=?]", "task[task_image]"

      assert_select "input[name=?]", "task[task_state]"

      assert_select "input[name=?]", "task[project_id]"
    end
  end
end
