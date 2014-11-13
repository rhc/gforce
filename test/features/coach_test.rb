require "test_helper"

feature "A coach" do
  let(:coach) { users(:coach)  }
  before :each do
    sign_in_as coach
    visit root_path
  end

  scenario "can see the dashboard" do
    assert_content 'Dashboard'
  end

  scenario "can see the list of clients" do

  end
end
