require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User can be created with all parameters" do
    user = User.create(name: "Joe", email: "joe@test.com", password: "password")
    assert user.valid?
  end
  
  test "User is not valid if Name Missing" do
    user = User.create(email: "joe@test.com", password: "password")
    assert_not user.valid?
  end
  
  test "User is not valid if Email Missing" do
    user = User.create(name: "joe", password: "password")
    assert_not user.valid?
  end

end
