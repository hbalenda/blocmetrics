require 'factory_girl_rails'

10.times do
  FactoryGirl.create(:user)
end

users = User.all

25.times do
  FactoryGirl.create(:registered_app, user: users.sample)
end

registered_apps = RegisteredApp.all

75.times do
  FactoryGirl.create(:event, registered_app: registered_apps.sample)
end

events = Event.all

puts "You seeded #{users.count} users."
puts "You seeded #{registered_apps.count} registered applications."
puts "You seeded #{events.count} events."
