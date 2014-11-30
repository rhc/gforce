class TrainingSession < ActiveRecord::Base
  validates :starts_at, presence: true
  validates :minutes, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :location, presence: true

  has_many :attendances
  
#find a better name for minutes: duration, duration_in_minutes
  def ends_at
    starts_at + minutes.minutes
  end

  def overlaps?(other)
    (starts_at < other.ends_at) && ( other.starts_at < starts_at)
  end

  def to_s
    "Group Session on #{starts_at.to_s(:week_of_day_and_month_year)} from #{starts_at.to_s(:hours_and_minutes)} to #{ends_at.to_s(:hours_and_minutes)} at the #{location} "
  end

  private
  def two_sessions_cannot_overlap
    #todo here
  end

end
