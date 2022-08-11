class Workspaces::NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.recent(20)
    @notifications.map(&:read!)
  end
end
