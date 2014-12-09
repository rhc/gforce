require "test_helper"

describe Measurement do
  let(:measurement) { Measurement.new }

  it "must be valid" do
    measurement.must_be :valid?
  end
end
