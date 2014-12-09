require "test_helper"

feature "A coach can take client's measurements" do
  let(:coach) { users(:coach)  }
  let(:angelique) { clients(:angelique)}
  let(:john) { clients(:john)}
  let(:monday_session) { training_sessions(:monday)}

  before :each do
    sign_in_as coach
    visit training_session_path(monday_session)
  end

  scenario "During the session" do
    participant = monday_session.attendances.first
    participant.measurements.delete_all
    within "#participant_#{participant.id}" do
      click_link 'Take Measurements'
    end
    assert_content 'New Measurement'
    fill_in 'Weight (kgs)', with: 72
    fill_in 'Waist (cms)', with: 108
    fill_in 'Hip (cms)', with: 74
    fill_in 'Bicep (cms)', with: 32
    fill_in 'Thigh (cms)', with: 40
    click_button 'Create Measurement'
    assert_content "Weight: 72"
  end
end
