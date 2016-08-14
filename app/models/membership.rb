class Membership < ApplicationRecord
  belongs_to :goomp
  belongs_to :user

  validates :goomp_id, uniqueness: {scope: [:user_id]}
end
