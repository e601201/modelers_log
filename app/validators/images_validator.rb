class ImagesValidator < ActiveModel::EachValidator
  include ActiveSupport::NumberHelper

  def validate_each(record, attribute, value)
    return if value.blank? || !value.attached?
    has_error = false
    if options[:maximum]
      has_error = true unless validate_maximum(record, attribute, value)
    end
    if options[:content_type]
      has_error = true unless validate_content_type(record, attribute, value)
    end
    record.send(attribute).purge if options[:purge] && has_error
  end
  private

  def validate_maximum(record, attribute, value)
    if value.byte_size > options[:maximum]
      record.errors.add attribute, (options[:message] || I18n.t('.defaults.message.keep_under',
                                                         item: number_to_human_size(options[:maximum])))
      false
    else
      true
    end
  end

  def validate_content_type(record, attribute, value)
    if value.content_type.match?(options[:content_type])
      true
    else
      record.errors.add attribute, (options[:message] || I18n.t('.defaults.message.not_supported'))
      false
    end
  end
end
