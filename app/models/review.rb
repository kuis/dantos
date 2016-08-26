class Review < ApplicationRecord
  belongs_to :goomp, counter_cache: true
  belongs_to :user

  after_create :update_goomp_rating

  def update_goomp_rating
    goomp.update rating: goomp.reviews.average(:rating)
  end
end
