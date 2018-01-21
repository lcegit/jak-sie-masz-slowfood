class ChargesController < ApplicationController
  before_action :check_env


  def new
  end

  def create
    @order = Order.find(params[:order_id])
    @amount = 1000
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: stripe_token(params)
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Payment for Order'
      currency: 'usd'
    )
  end

  private

  def stripe_token(params)
    Rails.env.test? ? generate_test_token : params[:stripeToken]
  end

  def generate_test_token
    StripeMock.generate_card_token
  end

  def check_env
      StripeMock.start if Rails.env.test?
  end
end
