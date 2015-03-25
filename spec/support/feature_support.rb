def user_sign_in
  user = create_user

  visit signin_path

  fill_in :email, with: user.email
  fill_in :password, with: user.password

  click_button 'Sign In'
end
