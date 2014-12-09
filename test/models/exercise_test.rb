require "test_helper"

describe Exercise do
  let(:exercise) { Exercise.new }

  it "must be valid" do
    exercise.must_be :valid?
  end
end
