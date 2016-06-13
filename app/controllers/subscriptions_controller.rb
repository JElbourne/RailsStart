class SubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  before_action :user_subscribed!, only: [:edit]
  before_action :redirect_for_new_action, only: [:new]

  def new
  end

  def edit
  end

  def create
    customer = current_user.customer
    subscription = customer.subscriptions.create(
        source: params[:stripeToken],
        plan: "monthly"
    )

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id,
    }
    # Only update card on file if we are adding a new one.
    options.merge!(
      card_last4: params[:card_last4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_type: params[:card_type]
    ) if params[:card_last4]

    current_user.update(options)

    redirect_to root_url(host: (Rails.env.production? ? Rails.configuration.x.default_host : 'localhost:3000'), protocol: "http://"), notice: "Thank you for subscribing."
  end

  def destroy
    customer = current_user.customer
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.remove_subscription

    redirect_to root_url(host: (Rails.env.production? ? Rails.configuration.x.default_host : 'localhost:3000'), protocol: "http://"), notice: "Your subscription has been cancelled"
  end

  private

  def redirect_for_new_action
    if !user_signed_in?
      session["user_return_to"] = new_subscription_path
      redirect_to new_user_registration_url(host: (Rails.env.production? ? Rails.configuration.x.default_host : 'localhost:3000'), protocol: "http://")
    elsif !current_user.stripe_subscription_id.nil?
      redirect_to edit_subscription_url(host: (Rails.env.production? ? Rails.configuration.x.default_host : 'localhost:3000'), protocol: "http://")
    end
  end
  
  def user_subscribed!
    redirect_to new_subscription_url(host: (Rails.env.production? ? Rails.configuration.x.default_host : 'localhost:3000'), protocol: "http://"), alert: "You must be subscribed to use this application" unless current_user_subscribed?
  end

end
