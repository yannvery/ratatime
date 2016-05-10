require 'rails_helper'

RSpec.feature 'list projects' do
  scenario 'that only belongs to user' do
    signed_in_user = create(:user, email: 'signed@user.com')
    create(:project, name: 'It\'s mine', user: signed_in_user)
    create(:project, name: 'What\'s that ?')

    visit projects_path(as: signed_in_user)

    expect(page).to have_content('It\'s mine')
    expect(page).to_not have_content('What\'s that ?')
  end
end

RSpec.feature 'Add Project' do
  scenario 'as a user' do
    signed_in_user = create(:user, email: 'signed@user.com')
    visit projects_path(as: signed_in_user)
    click_link 'New Project'

    fill_in 'Name', with: 'New project'
    click_button('Create Project')

    expect(page).to have_content('Project was successfully created.')
  end
end

RSpec.feature 'Show project' do
  scenario 'as owner' do
    signed_in_user = create(:user, email: 'signed@user.com')
    project = create(:project, name: 'Master of universe', user: signed_in_user)

    visit project_path(project, as: signed_in_user)

    expect(page).to have_content('Master of universe')
  end

  scenario 'not belongs to user' do
    signed_in_user = create(:user, email: 'signed@user.com')
    project = create(:project, name: 'Master of universe')

    visit project_path(project, as: signed_in_user)

    expect(page).to have_content('You are not authorized to perform this action.')
  end
end
