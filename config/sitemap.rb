# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://modelers-log.com'

SitemapGenerator::Sitemap.create do
  add projects_path, priority: 0.7, changefreq: 'daily'
  Project.find_each do |project|
    add project_path(project), lastmod: project.updated_at
    add project_tasks_path(project)
  end

  add workspaces_path, priority:0.7, changefreq: 'daily'
  Workspace.find_each do |workspace|
    add workspace_path(workspace), lastmod: workspace.updated_at
  end
end
