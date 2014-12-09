class PerformancesController < ApplicationController
  before_action :set_performance, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @performances = Performance.all
    respond_with(@performances)
  end

  def show
    respond_with(@performance)
  end

  def new
    @attendance = Attendance.find(params[:attendance_id])
    @planned_workouts = @attendance.training_session.planned_workouts
    @performance = @attendance.performances.build
    respond_with(@performance)
  end

  def edit
  end

  def create
    @attendance = Attendance.find(params[:attendance_id])
    @performance = @attendance.performances.build(performance_params)
    if @performance.save
      redirect_to @performance.attendance.training_session
    else
      respond_with(@performance)
    end
  end

  def update
    if @performance.update(performance_params)
      redirect_to @performance.attendance.training_session
    end
  end

  def destroy
    @performance.destroy
    redirect_to @performance.attendance.training_session
  end

  private
    def set_performance
      @performance = Performance.find(params[:id])
    end

    def performance_params
      params.require(:performance).permit(:attendance_id, :planned_workout_id, :score)
    end
end
