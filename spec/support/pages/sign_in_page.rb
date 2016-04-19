class SignInPage < Page
  def path
    sign_in_path
  end

  def sign_in_as(user)
    fill_in :session_email, with: user.email
    fill_in :session_password, with: 'foobar'
    click_button "Sign in"
  end
end
