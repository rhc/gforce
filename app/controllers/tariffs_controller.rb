class TariffsController < ApplicationController
  before_action :set_tariff, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tariffs = Tariff.all
    respond_with(@tariffs)
  end

  def show
    respond_with(@tariff)
  end

  def new
    @tariff = Tariff.new
    respond_with(@tariff)
  end

  def edit
  end

  def create
    @tariff = Tariff.new(tariff_params)
    @tariff.save
    respond_with(@tariff)
  end

  def update
    @tariff.update(tariff_params)
    respond_with(@tariff)
  end

  def destroy
    @tariff.destroy
    respond_with(@tariff)
  end

  private
    def set_tariff
      @tariff = Tariff.find(params[:id])
    end

    def tariff_params
      params.require(:tariff).permit(:starts_on, :expires_on, :amount)
    end
end
