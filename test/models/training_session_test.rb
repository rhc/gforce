require "test_helper"

describe TrainingSession do
  let(:training_session) { TrainingSession.new }

  it "must be valid" do
    training_session.must_be :valid?
  end
end
