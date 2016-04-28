require 'rails_helper'

RSpec.feature 'Add tracker' do
  scenario 'as a user' do
    sign_in
    create(:project, name: 'Master of the universe', user: signed_in_user)
    visit new_tracker_path

    fill_in('tracker_duration', with: '10m')
    fill_in('tracker_description', with: 'This is a test')
    select 'Master of the universe', from: 'tracker_project_id'
    click_button('Create tracker')

    expect(page).to have_content('Tracker was successfully created.')
  end
end

RSpec.feature 'Show tracker' do
  scenario 'With a readable duration' do
    sign_in
    tracker = create(:tracker, duration: '15m', description: 'Description')
    visit tracker_path(tracker)

    expect(page).to have_content('15 minutes')
  end
end
