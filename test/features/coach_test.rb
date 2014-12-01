require "test_helper"

feature "In order to manage clients, a coach " do
  let(:coach) { users(:coach)  }
  let(:angelique) { clients(:angelique)}
  let(:john) { clients(:john)}
  before :each do
    sign_in_as coach
    visit root_path
  end

  scenario " see the dashboard" do
    assert_content 'Dashboard'
    assert_content 'Clients'
  end

  scenario " see the list of clients" do
    assert_content angelique.full_name
    assert_content john.full_name
  end

  scenario  " register new client" do
    click_link "New Client" 
    fill_in "First Name", with: "Alain"
    fill_in "Last Name", with: "Delon"
    fill_in 'Sex', with: "Male"
    fill_in 'Email', with: 'ad@gmail.com'
    fill_in 'Date of Birth', with: '03/05/1989'
    click_button "Create Client"

    assert_content "Client has been registered."
  end

  scenario  " view the profile of a client" do
    click_link angelique.full_name 
  end

  scenario  " see the history of a client's payments" do
    click_link angelique.full_name
    click_link 'Payment History'
  end

  scenario 'can accept a payment' do
    click_link angelique.full_name
    click_link 'New Payment'
    fill_in 'Paid on', with: Date.today
    fill_in "Amount", with: 150
    click_button 'Create Payment'
  end

  scenario 'Searching for a client' do

  end

  scenario 'list clients who are in arrears' do
    #todo
    assert_content "In Arrears"
  end


  scenario 'Manage tariffs' do
    click_link 'Tariffs'
    assert_content 'Listing Tariffs'
  end

  scenario 'list clients that need attention' do
    assert_content 'Need Attention'
  end

end
