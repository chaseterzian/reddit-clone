require 'rails_helper'

feature 'User sign in' do
  scenario 'User can sign in with valid credentials' do
    user = create_user

    visit root_path
    click_link 'Sign In'
    expect(current_path).to eq signin_path
    expect(page).to have_content 'Sign In Page'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(current_path).to eq root_path
    expect(page).to have_content 'You have successfully signed in!'

  end

  scenario 'User cannot sign in with invalid credentials' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'fake@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign In'

    expect(current_path).to eq signin_path
    expect(page).to have_no_content 'You have successfully signed in!'
    expect(page).to have_content 'User / Password combination invalid'

  end
end
