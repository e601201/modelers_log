class ProjectDecorator < ApplicationDecorator
  delegate_all

  def percentage_of_done_tasks
    return '0' if tasks.blank?

    tasks.done.count * 100 / tasks.count
  end

  def rate_of_done_tasks
    return '0/0' if tasks.blank?

    "#{tasks.done.count}/#{tasks.count}"
  end

  def form_body
    <<~EOSQL
      例)
      * 組立からスミ入れまで。
      * 合わせ目やパーティングラインの処理に力を入れました！！
    EOSQL
  end
end
