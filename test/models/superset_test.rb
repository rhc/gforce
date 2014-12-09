require "test_helper"

describe Superset do
  let(:superset) { Superset.new }

  it "must be valid" do
    superset.must_be :valid?
  end
end
