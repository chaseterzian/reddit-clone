def create_user(overrides ={})
  User.create!({
    :first_name => 'Rick',
    :last_name => 'Grimes',
    :email => 'walkingdead@email.com',
    :password => 'Karl!'
  }.merge(overrides))
end

def create_post(user, overrides ={})
  Post.create!({
    :title => 'Kill Zombies',
    :description => 'Watch out for bad people and kill all zombies',
    :user_id => user.id
  }.merge(overrides))
end
