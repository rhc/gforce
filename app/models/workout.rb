class Workout < ActiveRecord::Base
  belongs_to :unit
  has_many :supersets
  has_many :planned_workouts

  def to_s
    name
  end
end
