class Template::PaintingsController < ApplicationController
  def create
    @project = current_user.projects.create!(title: '塗装テンプレ_タイトル', body: '塗装テンプレ_本文')
    @project.tasks.create!(title: '素組み', body: 'パーツチェックから素組みまで')
    @project.tasks.create!(title: 'やすりがけ', body: 'ゲート跡、パーティングライン処理', task_category: 'surface')
    @project.tasks.create!(title: 'サフ吹き', body: '使用するサーフェイサー', task_category: 'surface')
    @project.tasks.create!(title: '下地塗装', body: '使用する塗料：（任意の塗料）', task_category: 'painting')
    @project.tasks.create!(title: '表面塗装', body: '使用する塗料：（任意の塗料）', task_category: 'painting')
    @project.tasks.create!(title: 'コーティング', body: 'つや消し、半光沢、光沢スプレー', task_category: 'painting')
    @project.tasks.create!(title: 'デカール', body: '(任意で追加)', task_category: 'other')
    @project.tasks.create!(title: '墨入れ', body: '(任意で追加)', task_category: 'other')
    redirect_to @project
  end
end
