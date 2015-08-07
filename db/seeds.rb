# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all

#Create test users & plans
user = User.new(email: 'uma@thurman.com',
                password: '12345678', password_confirmation: '12345678',
                first_name: "Black",
                last_name: "Mamba")
user.skip_confirmation!
user.save

user = User.new(:email => 'bill@deadlyviper.com',
                :password => '12345678', password_confirmation: '12345678',
                :first_name => 'Bill',
                :last_name => '  ')
user.skip_confirmation!
user.save


  user = User.new(:email => 'oren@deadlyviper.com',
                  :password => '12345678', password_confirmation: '12345678',
                  :first_name => 'O-Ren',
                  :last_name => 'Ishii')
  user.skip_confirmation!
  user.save

  user = User.new(:email => 'vernita@deadlyviper.com',
                  :password => '12345678', password_confirmation: '12345678',
                  :first_name => 'Vernita',
                  :last_name => 'Green')
  user.skip_confirmation!
  user.save

  user = User.new(:email => 'elle@deadlyviper.com',
                  :password => '12345678', password_confirmation: '12345678',
                  :first_name => 'Elle',
                  :last_name => 'Driver')
  user.skip_confirmation!
  user.save

  user = User.new(:email => 'bud@deadlyviper.com',
                  :password => '12345678', password_confirmation: '12345678',
                  :first_name => 'Budd',
                  :last_name => '  ')
  user.skip_confirmation!
  user.save
