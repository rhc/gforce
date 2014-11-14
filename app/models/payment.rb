class Payment < ActiveRecord::Base
  validates :amount, presence: true
  validates :paid_on, presence: true
  belongs_to :client
end
