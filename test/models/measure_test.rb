require "test_helper"

describe Measure do
  let(:measure) { Measure.new }

  it "must be valid" do
    measure.must_be :valid?
  end
end
