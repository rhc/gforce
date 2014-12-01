require "test_helper"

describe TrainingSession do

  it "can not overlap with a previously saved session" do
    datetime = Date.today + 16.hours
    ts1 = TrainingSession.new( starts_at: datetime, location: 'Stadium', minutes: 60 )
    ts2 = TrainingSession.new( starts_at: datetime + 30.minutes, location: 'Stadium', minutes: 60 )
    assert ts2.overlaps?(ts1)
    ts1.save
    assert ts2.invalid?
  end
end
