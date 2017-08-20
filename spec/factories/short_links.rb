require 'faker'

FactoryGirl.define do
  factory :short_link do |sl|
    sl.destination { Faker::Internet.url('example.com') }
    sl.visits { Faker::Number.between(0, 500) }
    sl.slug { Faker::Number.number(8) }
    sl.created_at { Faker::Date.between(2.days.ago, Date.today) }
    sl.updated_at { Faker::Date.between(2.days.ago, Date.today) }
  end
end
