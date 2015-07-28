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

  plan  = Plan.new(name: "Beer & Barbeque!",
                   short_desc: 'Let\'s get together for an epic BBQ day',
                   long_desc: Faker::Lorem.paragraph,
                   image_url: "http://anterosfoundation.com/wp-content/uploads/2015/02/barbecue-party.jpg")
  plan.user = user
  plan.plan_dates.new(start_date: DateTime.now+20.days, all_day: true)
  plan.plan_dates.new(start_date: DateTime.now+27.days, all_day: true)
  plan.plan_locations.new(name: 'Albert\'s place')
  plan.save


user = User.new(:email => 'andreumasferrer@outlook.com',
                :password => '12345678', password_confirmation: '12345678')
user.skip_confirmation!
user.save

  plan  = Plan.new(name: 'Beach day',
                 short_desc: 'Let\'s have a nice day at the beach',
                 long_desc: Faker::Lorem.paragraph,
                 image_url: "http://www.plettenbergbay.co.za/wp-content/uploads/2013/07/4-home.jpg")
  plan.user = user
  plan.plan_dates.new(start_date: DateTime.now+10.days, all_day: true)
  plan.plan_locations.new(name: 'Platja de Garraf')
  plan.plan_locations.new(name: 'Sitges')
  plan.plan_locations.new(name: 'Calella de Palafrugell')
  plan.save


#Create 5 more random users
5.times do |i|
  user = User.new(email: Faker::Internet.email,
                  password: "12345678", password_confirmation: '12345678')
  user.skip_confirmation!
  user.save
end


#Create test plans
