class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: :welcome
  def welcome
    @projects = Project.includes(:tasks).order(created_at: :desc)
    @workspaces = Workspace.includes(:projects).order(created_at: :desc)
    @news = News.all.latest_news_of_this_week
  end
end
