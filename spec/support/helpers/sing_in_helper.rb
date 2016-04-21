module SignInHelper
  def sign_in(user = FactoryGirl.create(:ratatime_user))
    SignInPage.new.visit.sign_in_as(user)
    @current_user = user
  end

  def signed_in_user
    @current_user
  end
end

RSpec.configure do |config|
  config.include SignInHelper, type: :feature
end
