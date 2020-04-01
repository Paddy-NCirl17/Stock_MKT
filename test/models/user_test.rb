require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without a data" do
  	user = User.new
  	assert user.save
  end
end
