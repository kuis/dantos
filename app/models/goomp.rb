class Goomp < ApplicationRecord
  validates :name, presence: true
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :subtopics
  has_many :posts
  has_many :memberships
  has_many :members, through: :memberships
end
