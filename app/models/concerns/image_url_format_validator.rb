class ImageUrlFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !is_correct_image_format?(value)
      record.errors.add attribute, "must be a valid format"
    end
  end

  private

  def is_correct_image_format?(url)
    valid_image_formats = ['jpg', 'jpeg', 'gif', 'png']
    url_image_format = url.split('.').last
    valid_image_formats.include?(url_image_format)
  end
end