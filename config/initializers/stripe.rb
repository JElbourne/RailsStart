Stripe.api_key = ENV["stripe_api_key"]

class RecordCharges
  def call(event)
    charge = event.data.object #=> #<Stripe::Charge:0x3fcb34c115f8>
    # Look up the user in our database
    user = User.find_by(stripe_id: charge.customer)
    # Record charge in our database
    c = user.charges.where(stripe_charge_id: charge.id).first_or_initialize
    c.assign_attributes(
      amount_in_cents: charge.amount,
      card_last4: charge.source.last4,
      card_type: charge.source.brand,
      card_exp_month: charge.source.exp_month,
      card_exp_year: charge.source.exp_year
    )
    c.save
  end
end

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded', RecordCharges.new
end
