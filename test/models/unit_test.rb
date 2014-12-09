require "test_helper"

describe Unit do
  let(:unit) { Unit.new }

  it "must be valid" do
    unit.must_be :valid?
  end
end
