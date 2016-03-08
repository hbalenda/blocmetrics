FactoryGirl.define do
  factory :registered_app do
    name { Faker::Company.name }
    url { Faker::Internet.url }
  end
end
