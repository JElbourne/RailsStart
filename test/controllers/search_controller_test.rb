require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  setup do
    @user = users(:subscribed)
    sign_in @user
  end

  test "should search" do
    get :index, q: "my+first+pro"
    assert_response :success
  end
end
