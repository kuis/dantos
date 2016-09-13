class Photo < ApplicationRecord
  mount_uploader :data, AssetUploader
end
