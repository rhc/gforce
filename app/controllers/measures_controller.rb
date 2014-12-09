class MeasuresController < ApplicationController
  before_action :set_measure, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @measures = Measure.all
    respond_with(@measures)
  end

  def show
    respond_with(@measure)
  end

  def new
    @measure = Measure.new
    respond_with(@measure)
  end

  def edit
  end

  def create
    @measure = Measure.new(measure_params)
    @measure.save
    respond_with(@measure)
  end

  def update
    @measure.update(measure_params)
    respond_with(@measure)
  end

  def destroy
    @measure.destroy
    respond_with(@measure)
  end

  private
    def set_measure
      @measure = Measure.find(params[:id])
    end

    def measure_params
      params.require(:measure).permit(:name, :unit_id)
    end
end
