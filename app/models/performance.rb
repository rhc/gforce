class Performance < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  belongs_to :attendance
  belongs_to :planned_workout
  validates :attendance, presence: true
  validates :planned_workout, presence: true

  def score_line
    "#{score} #{unit} #{time_ago_in_words( attendance.training_session.starts_at)}"
  end

  def unit
    planned_workout.workout.unit
  end

end
