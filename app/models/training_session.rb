class TrainingSession < ActiveRecord::Base
  validates :starts_at, presence: true
  validates :minutes, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :location, presence: true
  validate :cannot_overlap_with_a_previously_saved_session

  has_many :attendances
  
#find a better name for minutes: duration, duration_in_minutes
  def ends_at
    starts_at + minutes.minutes
  end

  def overlaps?(other)
    (starts_at <= other.ends_at) && ( other.starts_at <= starts_at)
  end

  def to_s
    "Group Session on #{starts_at.to_s(:week_of_day_and_month_year)} from #{starts_at.to_s(:hours_and_minutes)} to #{ends_at.to_s(:hours_and_minutes)} at the #{location} "
  end

  private
  def cannot_overlap_with_a_previously_saved_session
    overlaps = TrainingSession.select {|ts| overlaps?(ts) && ts != self}.map(&:to_s)
    errors.add(:starts_at, "overlaps with another session #{overlaps}" ) if overlaps.any?
  end

end
