module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'Modelers Log'

    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def emmbed_svg(object)
    YAML.load_file('icon_svg.yml')[object]
  end

  def sns_link(sns)
    case sns.sns_category
    when 'twitter'
      "https://twitter.com/#{sns.sns_account}"
    when 'facebook'
      "https://www.facebook.com/profile.php?id=#{sns.sns_account}"
    when 'instagram'
      "https://www.instagram.com/#{sns.sns_account}/"
    end
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
        { href: image_url('modelers-log.ico') }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: :canonical,
        image: image_url('OGP.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@nagaemon1111'
      }
    }
  end
end
