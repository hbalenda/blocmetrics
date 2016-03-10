require 'factory_girl_rails'

User.create(username: "hcbviolet", email: "hcbviolet@gmail.com", password:"helloworld")

10.times do
  FactoryGirl.create(:user)
end

users = User.all

30.times do
  FactoryGirl.create(:registered_app, user: users.sample)
end

registered_apps = RegisteredApp.all

150.times do
  FactoryGirl.create(:event, registered_app: registered_apps.sample)
end

events = Event.all

puts "You seeded #{users.count} users."
puts "You seeded #{registered_apps.count} registered applications."
puts "You seeded #{events.count} events."
