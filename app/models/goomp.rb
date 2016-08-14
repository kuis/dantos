class Goomp < ApplicationRecord
  validates :name, presence: true
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :subtopics
  has_many :posts
end
