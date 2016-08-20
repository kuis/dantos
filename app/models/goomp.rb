class Goomp < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  monetize :price_cents

  belongs_to :user, touch: true
  has_many :subtopics, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  validates :name, :cover, :description, :user, presence: true

  def has_member? user
    memberships.any? { |m| m.user_id == user.id }
  end
end
