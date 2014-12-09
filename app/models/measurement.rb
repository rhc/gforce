class Measurement < ActiveRecord::Base
  belongs_to :attendance
  belongs_to :measure

  def to_s
   "Weight: #{weight} Waist: #{waist} Hip: #{hip} Bicep: #{bicep} Thigh: #{thigh}"
  end
end
