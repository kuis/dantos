class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :followable, polymorphic: true, counter_cache: true
end
