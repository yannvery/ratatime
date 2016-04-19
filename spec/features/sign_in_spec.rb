require 'rails_helper'

RSpec.feature 'User sign in' do
  scenario 'and show trackers list' do
    user = create(:ratatime_user)
    sign_in_page = SignInPage.new
    sign_in_page.visit.sign_in_as(user)

    expect(current_path).to eq root_path
  end
end
