require 'rails_helper'
require 'clearance/rspec'

RSpec.describe ProjectsController, '#show' do
  context 'When the project does not belongs_to signed_user' do
    it 'return not authorized' do
      project = create(:project, user: create(:user, email: 'another@user.com'))
      user = create(:user)
      sign_in_as(user)

      get :show, params: { id: project.id }

      expect(response.status).to eq 302
    end
  end
end
