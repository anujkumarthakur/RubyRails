class PaymentsController < ApplicationController
  def new
    # Your new payment form
  end

  def create
    begin
      customer = Stripe::Customer.create({
        :email => params[:stripeEmail],
        :source => params[:stripeToken]
      })
      
      charge = Stripe::Charge.create({
        :customer => customer.id,
        :amount => 500,
        :description => 'This is Test Products',
        :currency => 'inr'
      })

      @charge_id = charge.id
      @charge_status = charge.status
      @charge_amount = charge.amount

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_payment_path
    end
  end

  def transaction_history
    begin
      charges = Stripe::Charge.list
      @charges = charges.data

      render 'transaction_history'
    rescue Stripe::StripeError => e
      flash[:error] = e.message
      redirect_to "/"
    end
  end
end
