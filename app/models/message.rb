class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates_presence_of :room, :user
end
