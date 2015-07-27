# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all

#Create test users & plans
user = User.new(email: 'andreumasferrer@gmail.com',
                password: '12345678', password_confirmation: '12345678')
user.skip_confirmation!
user.save

plan  = Plan.new(name: "Let's do a BBQ")
plan.user = user
plan.save


user = User.new(:email => 'andreumasferrer@outlook.com',
                :password => '12345678', password_confirmation: '12345678')
user.skip_confirmation!
user.save

#
# #Create 8 more random users
# 8.times do |i|
#   user = User.new(email: Faker::Internet.email,
#                   password: "12345678", password_confirmation: '12345678')
#   user.skip_confirmation!
#   user.save
# end


#Create test plans
