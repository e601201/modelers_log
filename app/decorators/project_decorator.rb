class ProjectDecorator < ApplicationDecorator
  delegate_all

  def percentage_of_done_tasks
    return '0' if tasks.blank?

    tasks.done.count * 100 / tasks.count
  end

  def rate_of_done_tasks
    return '0/0' if tasks.blank?

    "#{tasks.done.count} / #{tasks.count}"
  end
end
