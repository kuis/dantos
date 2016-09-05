class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :manager, class_name: "User"
  monetize :budget_cents

  before_create :generate_sequence_number

  def generate_sequence_number
    last_sequence = self.user.rooms.last&.sequence
    self.sequence = last_sequence || 1
  end
end
