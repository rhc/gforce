class Tariff < ActiveRecord::Base
  validates :starts_on, presence: true
  validates :expires_on, presence: true
  validate :expiration_date_cannot_be_before_the_start_date

  private

  def expiration_date_cannot_be_before_the_start_date
    if expires_on.present? && starts_on.present? && expires_on < starts_on
      errors.add(:expiration_date, "can't be in before the start date")
    end
  end
end
