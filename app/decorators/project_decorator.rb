class ProjectDecorator < ApplicationDecorator
  delegate_all

  def percentage_of_done_tasks
    if tasks.present?
      tasks.done.count*100/tasks.count
    else
      "0"
    end
  end
end
