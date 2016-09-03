class Room < ApplicationRecord
  has_many :messages
  belongs_to :user
  belongs_to :manager, class_name: "User"
end
