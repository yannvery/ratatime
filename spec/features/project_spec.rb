require 'rails_helper'

RSpec.feature 'list projects' do
  scenario 'as a user' do
    create(:project, name: 'Peace world', user: create(:user, email: 'another@user.com'))
    create(:project, name: 'Harmony', user: create(:user))
    signed_in_user = create(:user, email: 'signed@user.com')
    create(:project, name: 'Master of universe', user: signed_in_user)

    visit projects_path(as: signed_in_user)

    expect(page).to have_content('Master of universe')
    expect(page).not_to have_content('Peace world')
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
  scenario 'as a user' do
    signed_in_user = create(:user, email: 'signed@user.com')
    project = create(:project, name: 'Master of universe', user: signed_in_user)
    visit project_path(project, as: signed_in_user)

    expect(page).to have_content('Master of universe')
  end
end
