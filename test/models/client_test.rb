require "test_helper"

describe Client do

  it "must have the following fields" do
    [:first_name, :last_name, :gender, :birth_date, :email, :mobile_phone].each do |field|
      assert Client.new.respond_to?(field), "Client must have the #{field} attribute."
    end
  end
end
