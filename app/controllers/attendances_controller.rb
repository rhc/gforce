class AttendancesController < ApplicationController
  before_action :set_training_session, only: [:new, :create]
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @attendances = Attendance.all
  end

  def show
  end

  def new
    @attendance = @training_session.attendances.new
  end

  def edit
  end

  def create
    @attendance = @training_session.attendances.build(attendance_params)
    if @attendance.save
      flash[:notice] = "#{@attendance.client.full_name} joined the training session."
      redirect_to training_session_path(@attendance.training_session)
    else
      flash[:error] = 'Please retry'
      render :new
    end

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

  def set_training_session
    @training_session = TrainingSession.find(params[:training_session_id]) 
  end

  def attendance_params
    params.require(:attendance).permit(:training_session_id, :client_id)
  end
end
