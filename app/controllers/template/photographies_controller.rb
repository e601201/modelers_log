class Template::PhotographiesController < ApplicationController
  def create
    @project = current_user.projects.create!(title: '撮影テンプレ_タイトル', body: '撮影テンプレ_本文')
    @project.tasks.create!(title: '正面', body: '正面', task_category: 'photography')
    @project.tasks.create!(title: '背面', body: '背面', task_category: 'photography')
    @project.tasks.create!(title: '側面', body: '側面', task_category: 'photography')
    @project.tasks.create!(title: 'ポーズ1', body: '好きなポーズ', task_category: 'photography')
    @project.tasks.create!(title: 'ポーズ2', body: '好きなポーズ', task_category: 'photography')
    @project.tasks.create!(title: 'ポーズ3', body: '好きなポーズ', task_category: 'photography')
    redirect_to @project
  end
end
