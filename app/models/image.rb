class Image < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  validates :image_url, presence: true, image_url_format: true
end
