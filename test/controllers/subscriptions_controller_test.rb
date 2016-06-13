require 'test_helper'
require 'stripe_mock'

class SubscriptionsControllerTest < ActionController::TestCase
  def stripe_helper
    StripeMock.create_test_helper
  end

  setup do
    StripeMock.start
  end

  teardown do
    StripeMock.stop
  end

  test "should get new, if User not subscribed" do
    sign_in users(:unsubscribed)
    get :new
    assert_response :success
  end
  
  test "should not get new, instead redirect to register page, if User not logged in" do
    users(:unsubscribed)
    get :new
    assert_redirected_to new_user_registration_url(host: "localhost")
  end
  
  test "should redirect to :edit from :new, if User subscribed" do
    sign_in users(:subscribed)
    get :new
    assert_redirected_to edit_subscription_url(host: "localhost")
  end
  
  test "should create Subscription" do
    stripe_helper.create_plan(id: 'monthly', amount: 10)
    card_token = stripe_helper.generate_card_token
    @user = users(:unsubscribed)
    user_id = @user.id
    sign_in @user
    assert_nil User.find(user_id).card_last4
    post :create,{ stripeToken: card_token, card_last4: "4444", card_exp_month: "02", card_exp_year: "84", card_type: "visa"}
    assert_not_nil User.find(user_id).card_last4
  end

  test "should get edit, if User subscribed" do
    sign_in users(:subscribed)
    get :edit
    assert_response :success
  end
  
  test "should not get edit, if User is not subscribed, redirect to new" do
    sign_in users(:unsubscribed)
    get :edit
    assert_redirected_to new_subscription_url(host: "localhost")
  end
  
  test "should destroy subscription" do
    stripe_helper.create_plan(id: 'monthly', amount: 10)
    customer = Stripe::Customer.create({
            email: 'johnny@appleseed.com' })
    subscription = customer.subscriptions.create(
        source: stripe_helper.generate_card_token,
        plan: "monthly"
    )
    @user = users(:subscribed)
    @user.stripe_subscription_id = subscription.id
    @user.stripe_id = customer.id
    @user.save
    user_id = @user.id
    sign_in @user
    assert_not_nil User.find(user_id).stripe_subscription_id
    delete :destroy
    assert_nil User.find(user_id).stripe_subscription_id
  end
end
