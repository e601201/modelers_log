class Workspaces::NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
  end
end
