require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @post = create :post
    @user = create :user
  end
end
