# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Workspace.destroy_all
News.destroy_all
5.times{ FactoryBot.create(:news) }

#ログイン用ユーザー

Workspace.create(
  email: 'daichi@example.com',
  password: 'Itg43y0G',
  password_confirmation: 'Itg43y0G',
  owner_name: 'daichi',
  owner_comment: 'メインユーザーです'
)


user = Workspace.create!(
  email: 'test1@example.com',
  password: 'Itg43y0G',
  password_confirmation: 'Itg43y0G',
  owner_name: 'test1',
  owner_comment: 'test_comment1'
)
#完成していないプロジェクト
project = Project.create!(
  title: 'title',
  body: 'body',
  state: 'in_progress',
  workspace_id: user.id
)
Task.create!(
  title: 'title',
  body: 'body',
  project_id: project.id,
  task_state: 'done'
)
Task.create!(
  title: 'title',
  body: 'body',
  project_id: project.id,
  task_state: 'in_progress'
)

user2 = Workspace.create!(
  email: 'test2@example.com',
  password: 'Itg43y0G',
  password_confirmation: 'Itg43y0G',
  owner_name: 'test2',
  owner_comment: 'test_comment2'
)

#完成しているプロジェクト
project2 = Project.create!(
  title: 'title',
  body: 'body',
  state: 'done',
  workspace_id: user2.id
)
Task.create!(
  title: 'title1',
  body: 'body',
  project_id: project2.id,
  task_state: 'done'
)
Task.create!(
  title: 'title2',
  body: 'body',
  project_id: project2.id,
  task_state: 'done'
)