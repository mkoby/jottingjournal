class Subscription < ActiveRecord::Base
  belongs_to :user
  attr_accessible :plan, :stripe_customer_id, :stripe_token
  before_destroy :delete_stripe_customer

  private

  def delete_stripe_customer
    Stripe.api_key = ENV['STRIPE_API_KEY_SECRET']
    customer = Stripe::Customer.retrieve(self.stripe_customer_id)
    customer.delete
  end
end
