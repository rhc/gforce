require "test_helper"

describe Invoice do
  let(:invoice) { Invoice.new }

  it "must be valid" do
    invoice.must_be :valid?
  end
end
