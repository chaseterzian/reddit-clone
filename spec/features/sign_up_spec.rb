require 'rails_helper'

feature 'User can signup' do
  scenario 'allow a user to sign up' do
    visit root_path
    click_link 'Sign Up'

    expect(current_path).to eq '/signup'
    expect(page).to have_content 'User Sign Up'

    fill_in 'First name', with: 'Sterling'
    fill_in 'Last name', with: 'Archer'
    fill_in 'Email', with: 'archer@email.com'
    fill_in 'Password', with: 'dangerzone'
    fill_in 'Password confirmation', with: 'dangerzone'
    within ('.signup-form') {click_on 'Sign Up'}

    expect(current_path).to eq root_path
    expect(page).to have_content 'You have successfully signed up!'
  end
end
