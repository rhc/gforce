class PaymentsController < ApplicationController
  before_action :set_client
  before_action :set_payment, only: [:show, :edit, :update, :destroy, :watch]

  def index
  end

  def new
    @payment = @client.payments.build
  end

  def create
    @payment = @client.payments.build(payment_params)
    if @payment.save
      flash[:notice] = "Payment has been created."
      redirect_to @client
    else
      flash[:alert] = "Payment has not been created."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @payment.update(payment_params)
      flash[:notice] = 'payment has been updated.'
      redirect_to [@client, @payment]
    else
      flash[:alert] = 'payment has not been updated.'
      render :edit
    end
  end

  def destroy
    @payment.destroy
    flash[:notice] = "payment has been deleted."
    redirect_to @client
  end


  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_payment
    @payment = @client.payments.find(params[:id])
  end


  def payment_params
    params.require(:payment).permit(:paid_on, :amount)
  end

end
