class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :room
  belongs_to :user

  validates_presence_of :room, :user, :body
end
