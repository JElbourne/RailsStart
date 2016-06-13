require 'test_helper'

class ChargeTest < ActiveSupport::TestCase
  setup do
    @params = {
      user_id: 1,
      stripe_charge_id: "234sdfs",
      amount_in_cents: 900,
      card_last4: "4242",
      card_exp_month: 12,
      card_exp_year: 2020,
      card_type: "Visa"
    }
  end

  test "Creates Charge with all parameters" do
    charge = Charge.create(@params)
    assert charge.valid?
  end

  test "Create Charge fails with missing user_id parameters" do
    charge = Charge.create(@params.except!(:user_id))
    assert_not charge.valid?
  end

  test "Create Charge fails with missing stripe_charge_id parameters" do
    charge = Charge.create(@params.except!(:stripe_charge_id))
    assert_not charge.valid?
  end

  test "Create Charge fails with missing amount_in_cents parameters" do
    charge = Charge.create(@params.except!(:amount_in_cents))
    assert_not charge.valid?
  end

  test "Create Charge fails with missing card_last4 parameters" do
    charge = Charge.create(@params.except!(:card_last4))
    assert_not charge.valid?
  end

  test "Create Charge fails with missing card_exp_month parameters" do
    charge = Charge.create(@params.except!(:card_exp_month))
    assert_not charge.valid?
  end

  test "Create Charge fails with missing card_exp_year parameters" do
    charge = Charge.create(@params.except!(:card_exp_year))
    assert_not charge.valid?
  end

  test "Create Charge fails with missing card_type parameters" do
    charge = Charge.create(@params.except!(:card_type))
    assert_not charge.valid?
  end

end
