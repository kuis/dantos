class Photo < ApplicationRecord
  mount_uploader :data, ImageUploader
end
