class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @attendances = Attendance.all
  end

  def show
  end

  def new
    @attendance = Attendance.new
  end

  def edit
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.save
  end

  def update
    @attendance.update(attendance_params)
  end

  def destroy
    ts = @attendance.training_session
    client = @attendance.client
    @attendance.destroy
    flash[:notice] = "#{client.full_name} has been removed from this session."
    redirect_to training_session_path(ts)
  end

  private
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def attendance_params
      params.require(:attendance).permit(:training_session_id, :client_id)
    end
end
