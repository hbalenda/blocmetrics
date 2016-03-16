event_names = Faker::Hipster.words(4)

FactoryGirl.define do
  factory :event do
    name { event_names.sample }
    registered_app
    created_at { Faker::Date.between(10.days.ago, Date.today) }
  end
end
