class Comment < ApplicationRecord
  include Likable
  belongs_to :post, touch: true
  belongs_to :user

  validates :body, presence: true
end
