class SupersetsController < ApplicationController
  before_action :set_superset, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @supersets = Superset.all
    respond_with(@supersets)
  end

  def show
    respond_with(@superset)
  end

  def new
    @superset = Superset.new
    respond_with(@superset)
  end

  def edit
  end

  def create
    @superset = Superset.new(superset_params)
    @superset.save
    respond_with(@superset)
  end

  def update
    @superset.update(superset_params)
    respond_with(@superset)
  end

  def destroy
    @superset.destroy
    respond_with(@superset)
  end

  private
    def set_superset
      @superset = Superset.find(params[:id])
    end

    def superset_params
      params.require(:superset).permit(:workout_id, :exercise_id, :unit_id, :amount, :sequence)
    end
end
