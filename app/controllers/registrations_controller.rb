class RegistrationsController < Devise::RegistrationsController
  before_filter :remove_billing_params, :only => [:create, :update]

  DEFAULT_PLAN_NAME = "jotting-journal-yearly"

  def new
    super
  end

  def create
    super
    handle_billing("new")
  end

  def update
    super
    handle_billing("update")
  end

  private

  def remove_billing_params
    params[:user].delete :billing
  end

  def handle_billing(action)
    if(action == "new")
      create_stripe_customer
      resource.subscription = Subscription.create(:stripe_customer_id => @stripe_customer.id, :stripe_token => params[:stripe_token], :plan => DEFAULT_PLAN_NAME) if @stripe_customer
    else
      update_stripe_customer
    end

  end

  def create_stripe_customer
    Stripe.api_key = ENV['STRIPE_API_KEY_SECRET']
    @stripe_customer = Stripe::Customer.create(
      :email => params[:user][:email], 
      :plan => DEFAULT_PLAN_NAME, 
      :card => params[:stripe_token]
    )
  end

  def update_stripe_customer
    Stripe.api_key = ENV['STRIPE_API_KEY_SECRET']
    customer = Stripe::Customer.retrieve(resource.subscription.stripe_customer_id)
    customer.card = params[:stripe_token]
    customer.save
  end
end
