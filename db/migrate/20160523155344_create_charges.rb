class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :user_id, null: false
      t.string :stripe_charge_id, null: false
      t.integer :amount_in_cents, null: false
      t.string :card_last4, null: false
      t.integer :card_exp_month, null: false
      t.integer :card_exp_year, null: false
      t.string :card_type, null: false

      t.timestamps null: false
    end
    add_index :charges, :stripe_charge_id, unique: true
  end
end
