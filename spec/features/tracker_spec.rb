require 'rails_helper'

RSpec.feature 'List trackers' do
  scenario 'that only belongs to user' do
    signed_in_user = create(:user, email: 'signed@user.com')
    create(:tracker, duration: '15m', description: 'It\' mine', user: signed_in_user)
    create(:tracker, duration: '30m', description: 'What\'s that ?')

    visit trackers_path(as: signed_in_user)
    expect(page).to have_content('15 minutes')
    expect(page).to_not have_content('30 minutes')
  end
end

RSpec.feature 'Create tracker' do
  scenario 'as a user' do
    signed_in_user = create(:user, email: 'signed@user.com')
    create(:project, name: 'Master of the universe', user: signed_in_user)
    visit new_tracker_path(as: signed_in_user)

    fill_in('tracker_duration', with: '10m')
    fill_in('tracker_description', with: 'This is a test')
    select 'Master of the universe', from: 'tracker_project_id'
    click_button('Create Tracker')

    expect(page).to have_content('Tracker was successfully created.')
  end
end

RSpec.feature 'Update a tracker' do
  scenario 'as a user' do
    signed_in_user = create(:user, email: 'signed@user.com')
    tracker = create(:tracker, duration: '15m', user: signed_in_user)
    visit trackers_path(as: signed_in_user)
    click_link("rat-edit-tracker-#{tracker.id}")

    fill_in 'tracker_duration', with: '1:00'
    click_button('Update Tracker')

    expect(page).to have_content('Tracker was successfully updated.')
    expect(current_path).to eq trackers_path
  end
end

RSpec.xfeature 'Show tracker' do
  context 'as owner' do
    scenario 'with a readable duration' do
      signed_in_user = create(:user, email: 'signed@user.com')
      tracker = create(:tracker, duration: '15m', description: 'Description', user: signed_in_user)
      visit tracker_path(tracker, as: signed_in_user)

      expect(page).to have_content('15 minutes')
    end
  end

  scenario 'not belongs to user' do
    signed_in_user = create(:user, email: 'signed@user.com')
    tracker = create(:tracker, duration: '15m', description: 'Description')
    visit tracker_path(tracker, as: signed_in_user)

    expect(page).to have_content('You are not authorized to perform this action.')
  end
end
