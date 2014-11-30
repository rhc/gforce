require "test_helper"

feature "In order to manage Training Sessions" do
  let(:client) { clients(:angelique)  }
  let(:training_session) { training_sessions(:one)}

  before :each do
    visit root_path
    click_link "Training sessions"
  end

  scenario "The coach schedule one session" do
    click_link 'Schedule New Training Session'
    select_date_and_time( Date.today , from: :training_session_starts_at)
    fill_in 'Minutes', with: '60'
    fill_in 'Location', with: 'Maracana'
    click_button 'Create Training session'

    assert_content "Training Session has been scheduled."
    assert_equal page.current_path, training_sessions_path
    
  end

  scenario "The coach can cancel a session" do

  end


  scenario "The coach can make notes regarding a session" do
    within "#training_session_#{training_session.id}" do
      click_link "Edit"
    end
    fill_in "Comments", with: "Very good session"
    click_button "Update Training session"
    assert_content "Training Session has been updated."
  end

  scenario "The coach can record the attendance of a client to a training session" do
    within "#training_session_#{training_session.id}" do
      click_link "Show"
    end
    click_button 'Attendance'
    click_button 'Add Participant'
    fill_in 'Client', with: client.full_name
    click_button "Select"
    assert_content "#{client.full_name} joined the training session."
    assert_content client.full_name

  end

end
