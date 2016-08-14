class Post < ApplicationRecord
  belongs_to :goomp
  belongs_to :user
  belongs_to :subtopic, optional: true
end
