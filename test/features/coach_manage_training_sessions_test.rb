require "test_helper"

feature "In order to manage Training Sessions" do
  let(:client) { clients(:john)  }
  let(:glen) { clients(:glen)}
  let(:training_session) { training_sessions(:monday)}

  before :each do
    visit root_path
    click_link "Training sessions"
  end

  scenario "The coach schedule one session" do
    click_link 'Schedule New Training Session'
    fill_in 'Starts at', with: Date.today + 5.years
    fill_in 'Minutes', with: '120'
    fill_in 'Location', with: 'Maracana'
    click_button 'Create Training session'

    assert_content "Training Session has been scheduled."
    assert_equal page.current_path, training_sessions_path

  end

  scenario "The coach can cancel a session" do


  end

  scenario "The coach cannot cancel a session with attendees" do
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
    click_link 'Add Participant'
    assert_content 'New attendance'
    select glen.full_name, from: 'Client'
    click_button "Create Attendance"
    assert_content "#{glen.full_name} joined the training session."
    assert_content glen.full_name
  end

end
