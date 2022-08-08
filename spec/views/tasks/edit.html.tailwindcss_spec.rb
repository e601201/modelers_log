require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      title: "MyString",
      body: "MyText",
      task_image: "MyString",
      task_state: 1,
      project: nil
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input[name=?]", "task[title]"

      assert_select "textarea[name=?]", "task[body]"

      assert_select "input[name=?]", "task[task_image]"

      assert_select "input[name=?]", "task[task_state]"

      assert_select "input[name=?]", "task[project_id]"
    end
  end
end
