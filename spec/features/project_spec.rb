require 'rails_helper'

RSpec.feature 'list projects' do
  scenario 'as a user' do
    sign_in
    create(:project, name: 'Peace world', user: create(:user, email: 'another@user.com'))
    create(:project, name: 'Harmony', user: create(:user))
    create(:project, name: 'Master of universe', user: signed_in_user)

    visit projects_path

    expect(page).to have_content('Master of universe')
    expect(page).not_to have_content('Peace world')
  end
end

RSpec.feature 'Add Project' do
  scenario 'as a user' do
    sign_in
    visit projects_path
    click_link 'New Project'

    fill_in 'Name', with: 'New project'
    click_button('Create project')

    expect(page).to have_content('Project was successfully created.')
  end
end

RSpec.feature 'Show project' do
  scenario 'as a user' do
    sign_in
    project = create(:project, name: 'Master of universe', user: signed_in_user)
    visit project_path(project)

    expect(page).to have_content('Master of universe')
  end
end
