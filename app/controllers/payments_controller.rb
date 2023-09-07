class PaymentsController < ApplicationController
  def new
    # Your new payment form
  end

  def create
    amount = params[:payment][:amount].to_i * 100  # Convert amount to cents
    secret_key = Rails.configuration.stripe[:secret_key]

    begin
      charge = Stripe::Charge.create(
        amount: amount,
        currency: 'usd',
        source: params[:stripeToken],
        description: 'anujtest'
      )

      # Handle successful payment
      # You can save the payment record to your database here

      redirect_to "/", notice: 'Payment was successful.'
    rescue Stripe::CardError => e
      flash[:error] = e.message
      render :new
    end
  end
end
