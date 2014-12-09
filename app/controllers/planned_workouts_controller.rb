class PlannedWorkoutsController < ApplicationController
  before_action :set_planned_workout, only: [:show, :edit, :update]

  respond_to :html

  def index
    @planned_workouts = PlannedWorkout.all
  end

  def show
  end

  def new
    @training_session = TrainingSession.find(params[:training_session_id])
    @planned_workout = @training_session.planned_workouts.build
  end

  def edit
  end

  def create
    @training_session = TrainingSession.find(params[:training_session_id])
    @planned_workout = @training_session.planned_workouts.build(planned_workout_params)
    if @planned_workout.save
      flash[:notice] = 'A new workout was added to the session.'
      redirect_to @planned_workout.training_session
    else
      flash[:error] = "Please retry"
      redirect_to :new
    end

  end

  def update
    @planned_workout.update(planned_workout_params)
    respond_with(@planned_workout)
  end

  def destroy
    @planned_workout = PlannedWorkout.find(params[:id])
    training_session = @planned_workout.training_session
    @planned_workout.destroy
    redirect_to training_session
  end

  private
    def set_planned_workout
      @planned_workout = Planned_workout.find(params[:id])
    end


    def planned_workout_params
      params.require(:planned_workout).permit(:workout_id, :training_session_id)
    end
end
