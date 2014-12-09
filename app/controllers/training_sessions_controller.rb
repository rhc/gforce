class TrainingSessionsController < ApplicationController
  before_action :set_training_session, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @training_sessions = TrainingSession.order(starts_at: :desc).page params[:page]
  end

  def show
    respond_with(@training_session)
  end

  def new
    @training_session = TrainingSession.new
    respond_with(@training_session)
  end

  def edit
  end

  def create
    @training_session = TrainingSession.new(training_session_params)
    if @training_session.save
      flash[:notice] = 'Training Session has been scheduled.'
      redirect_to training_sessions_path
    else
      render :new
    end
  end

  def update
    flash[:notice] = 'Training Session has been updated.' if @training_session.update(training_session_params)
    respond_with(@training_session)
  end

  def destroy
    if @training_session.attendances.empty?
      @training_session.destroy
      respond_with(@training_session)
    else
      flash[:warning] = "You can not delete a training session with #{@training_session.attendances.count} participants."
      redirect_to training_sessions_path
    end
  end

  private
    def set_training_session
      @training_session = TrainingSession.find(params[:id])
    end

    def training_session_params
      params.require(:training_session).permit( :starts_at, :location, :minutes)
    end
end
