class Post < ApplicationRecord
  belongs_to :goomp, touch: true
  belongs_to :user, touch: true
  belongs_to :subtopic, optional: true, touch: true
  has_many :comments, dependent: :destroy
  include Likable

  validates :goomp, :user, presence: true
end
