require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password '12345678'
    f.password_confirmation '12345678'
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
  end
  factory :confirmed_user, :parent => :user do
    after(:create) { |user| user.skip_confirmation! }
  end
end
