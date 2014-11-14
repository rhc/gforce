class Client < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  
  def full_name
    [first_name, last_name].join " "
  end
end
