class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :manager, class_name: "User"
  monetize :budget_cents

  validates_presence_of :category_name
  before_create { self.category_name ||= "Design" }
end
