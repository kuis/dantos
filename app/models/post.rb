class Post < ApplicationRecord
  belongs_to :goomp
  belongs_to :user
  belongs_to :subtopic, optional: true
  has_many :comments, dependent: :destroy

  validates :goomp, :user, presence: true
end
