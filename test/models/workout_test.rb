require "test_helper"

describe Workout do
  let(:workout) { Workout.new }

  it "must be valid" do
    workout.must_be :valid?
  end
end
