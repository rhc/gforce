class MeasurementsController < ApplicationController
  before_action :set_attendance, only: [:index, :new, :create]
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @measurements = @attendance.measurements.all
    respond_with(@measurements)
  end

  def show
    respond_with(@measurement)
  end

  def new
    @measurement = @attendance.measurements.build
  end

  def edit
  end

  def create
    @measurement = @attendance.measurements.build(measurement_params)
    if @measurement.save
      redirect_to @attendance.training_session
    else
      flash[:error] = "Measurement not taken"
      render :new
    end
  end

  def update
    if @measurement.update(measurement_params)
      redirect_to @measurement.attendance.training_session
    else
      flash[:error] = "Measurement not updated"
      redirect_to @measurement.attendance.training_session
    end
  end

  def destroy
    training_session = @measurement.attendance.training_session
    @measurement.destroy
    redirect_to training_session
  end

  private
    def set_attendance
      @attendance = Attendance.find(params[:attendance_id])
    end

    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    def measurement_params
      params.require(:measurement).permit(:attendance_id, :weight, :waist, :hip, :bicep, :thigh)
    end
end
