require 'rails_helper'

RSpec.feature 'Add tracker' do
  scenario 'as a user' do
    sign_in
    visit new_tracker_path

    fill_in('tracker_duration', with: '10m')
    fill_in('tracker_description', with: 'This is a test')
    click_button('Create tracker')

    expect(page).to have_content('Tracker was successfully created.')
  end
end
