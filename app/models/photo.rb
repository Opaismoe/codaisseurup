class Photo < ApplicationRecord
  belongs_to :event, dependent: :destroy

  mount_uploader :image, ImageUploader
end
