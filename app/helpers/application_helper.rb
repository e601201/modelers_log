module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'Modelers Log'

    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def emmbed_svg(object)
    YAML.load_file('icon_svg.yml')[object]
  end

  def default_meta_tags
    {
      site: 'Modelers Log',
      title: 'Modelers Log',
      reverse: false,
      charset: 'utf-8',
      description: 'プラモデラーのためのタスク管理、手順書共有サイトです。プラモデル作りを通してものづくりの楽しさを共有しましょう！！',
      keywords: 'modelers-log,プラモデル,手順書,タスク管理',
      canonical: 'https://modelers-log.com/',
      separator: '|',
      icon: [
        { href: image_url('sample_avatar.png') }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: :canonical,
        image: 'https://modelers-log.com/app/assets/images/sample_project.png',
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@nagaemon1111'
      }
    }
  end
end
