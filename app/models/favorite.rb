class Favorite < ApplicationRecord
  belongs_to :workspace
  belongs_to :project
  after_create :notification_to_folowers

  private

  def notification_to_folowers
    logger.debug 'フォロワーにいいねされたことを通知する(今後実装)'
  end
end
