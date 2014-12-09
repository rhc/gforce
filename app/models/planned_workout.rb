class PlannedWorkout < ActiveRecord::Base
  belongs_to :workout
  belongs_to :training_session
  validates :workout, presence: true
  validates :training_session, presence: true

  def to_s
    workout.to_s
  end

end
