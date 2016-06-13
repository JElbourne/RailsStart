class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :charges

  def subscribed?
    stripe_subscription_id?
  end

  def remove_subscription
    update(stripe_subscription_id: nil)
  end

  def customer
    if stripe_id?
      Stripe::Customer.retrieve(stripe_id)
    else
      Stripe::Customer.create(email: email)
    end
  end

  def self.get_subs_count
    where.not(stripe_subscription_id: nil).count
  end

end
