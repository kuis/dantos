class Membership < ApplicationRecord
  belongs_to :goomp, counter_cache: true
  belongs_to :user

  validates :goomp_id, uniqueness: {scope: [:user_id]}
end
