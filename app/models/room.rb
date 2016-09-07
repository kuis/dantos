class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :manager, class_name: "User"
  monetize :budget_cents

  validates_presence_of :category_name
  before_create { self.category_name ||= "Design" }

  def room_name_for_manager user, index
    "# #{self.user.slug}-#{self.category_name.downcase}-#{index+1}"
  end

  def room_name_for_client user, index
    "# #{self.category_name&.downcase}-#{index+1}""# #{self.category_name&.downcase}-#{index+1}"
    "# #{self.user.slug}-#{self.category_name.downcase}-#{index+1}"
  end

  def get_room_name_for_user user, index
    if user == self.user
      room_name_for_client user, index
    else user == self.manager
      room_name_for_manager user, index
    end
  end
end
