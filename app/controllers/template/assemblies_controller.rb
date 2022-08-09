class Template::AssembliesController < ApplicationController
  def create
    @project = current_user.projects.create!(title: '組立テンプレ_タイトル', body: '組立テンプレ_本文')
    @project.tasks.create!(title: '頭部パーツ', body: '頭部パーツの組み立て')
    @project.tasks.create!(title: '上半身パーツ', body: '上半身パーツの組み立て')
    @project.tasks.create!(title: '下半身パーツ', body: '下半身パーツの組み立て')
    @project.tasks.create!(title: '武器パーツ', body: '武器パーツの組み立て')
    @project.tasks.create!(title: 'オプションパーツ', body: 'オプションパーツの組み立て')
    redirect_to @project
  end
end
