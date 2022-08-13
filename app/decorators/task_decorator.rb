class TaskDecorator < ApplicationDecorator
  delegate_all

  def form_body
    <<~EOSQL
      例)
      * パーツチェックをする
      * ガンプラ設計図の頭部部分まで終わらせる。
      * 全体にサーフェイスを吹き付ける
      など
    EOSQL
  end
end
