require 'rails_helper'
require 'clearance/rspec'

RSpec.describe ProjectsController, '#show' do
  context 'When the project does not belongs_to signed_user' do
    it 'return not found' do
      project = create(:project, user: create(:user))
      user = create(:user)
      sign_in_as(user)

      get :show, id: project.id

      expect(response).to be_not_found
    end
  end
end
