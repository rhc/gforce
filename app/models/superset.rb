class Superset < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise
  belongs_to :unit
end
