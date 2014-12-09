class Attendance < ActiveRecord::Base
  belongs_to :training_session
  belongs_to :client
  has_many :performances
  has_many :measurements

  validates :training_session, presence: true
  validates :client, presence: true


  private
  def client_cannot_attend_training_session_before_registration

  end
end
