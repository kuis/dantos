class Post < ApplicationRecord
  belongs_to :goomp, touch: true
  belongs_to :user, touch: true
  belongs_to :subtopic, optional: true, touch: true
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy

  validates :goomp, :user, presence: true
end
