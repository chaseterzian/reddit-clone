require 'rails_helper'

feature 'Anyone can see list of Posts' do

  before :each do
    user1 = create_user
    user2 = create_user(first_name: 'Saul',
    last_name: 'Goodman',
    email: 'bettercallsaul@email.com',
    password: 'breakingbad')
    @post1 = create_post(user1)
    @post2 = create_post(user2, title: 'Need a lawyer?', description: 'Better Call Saul!')
  end

  scenario 'root page displays index of all posts' do
    visit root_path
    expect(page).to have_content 'Posts'
    expect(page).to have_content 'Kill Zombies'
    expect(page).to have_content 'Need a lawyer?'
  end

  scenario 'show page contains information for the post, and comments on the post' do
    visit root_path
    click_link 'Kill Zombies'
    expect(page).to have_content 'Kill Zombies'
    expect(page).to have_content 'Watch out for bad people and kill all zombies'
    expect(find_link('All Posts')[:href]).to eq(posts_path)
    click_link 'All Posts'
    expect(current_path).to eq (posts_path)
  end
end
