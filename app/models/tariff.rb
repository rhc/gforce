class Tariff < ActiveRecord::Base
  validates :starts_on, :expires_on, :amount, presence: true
  validate :expiration_date_cannot_be_before_the_start_date

  def overlap?(other)
    starts_on <= other.ends_on && other.starts_on <= ends_on
  end


  private

  def cannot_overlap_with_a_previously_saved_tariff
    overlaps = Tariff.select {|ts| overlaps?(ts) && ts != self}.map(&:to_s)
    errors.add(:base, "overlaps with another session #{overlaps}" ) if overlaps.any?
  end

  def expiration_date_cannot_be_before_the_start_date
    if expires_on.present? && starts_on.present? && expires_on < starts_on
      errors.add(:expiration_date, "can't be in before the start date")
    end
  end

end
