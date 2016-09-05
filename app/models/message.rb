class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :room
  belongs_to :user

  validates_presence_of :room, :user

  validate :body_or_image_present

  def body_or_image_present
    unless self.body.present? || self.image.present?
      errors[:body] << ("Please write something")
    end
  end
end
