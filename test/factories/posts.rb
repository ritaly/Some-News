require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:username) { Faker::Name.unique.name }
    sequence(:email) { Faker::Internet.email }
    #sequence(:email) { |n| "email#{n}@.pl" }
    password 'unicorn'
  end

  factory :post do
    title 'How to get rich quick'
    link 'example.com'
    text 'No idea sorry'
    user
  end
end
