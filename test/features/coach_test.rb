require "test_helper"

feature "A coach" do
  let(:coach) { users(:coach)  }
  let(:angelique) { clients(:angelique)}
  let(:john) { clients(:john)}
  before :each do
    sign_in_as coach
    visit root_path
  end

  scenario "can see the dashboard" do
    assert_content 'Dashboard'
    assert_content 'Clients'
  end

  scenario "can see the list of clients" do
    assert_content angelique.full_name
    assert_content john.full_name
  end

  scenario  "can register new client" do
    click_link "New Client" 
    fill_in "First Name", with: "Alain"
    fill_in "Last Name", with: "Delon"
    fill_in 'Sex', with: "Male"
    fill_in 'Email', with: 'ad@gmail.com'
    select_date( Date.today, from: "client_birth_date")
    click_button "Create Client"

    assert_content "Client has been registered."
  end

  scenario  "can view the profile of a client" do
    click_link angelique.full_name 
  end
end
