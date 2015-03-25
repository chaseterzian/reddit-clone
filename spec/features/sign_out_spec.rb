require 'rails_helper'

feature 'User sign out' do
  scenario 'User can sign out' do
    user_sign_in
    visit root_path
    click_link 'Sign Out'

    expect(current_path).to eq root_path
    expect(page).to have_content 'You have successfully signed out'
  end
end
