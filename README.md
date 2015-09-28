# Plands & Friends

Plans&Friends is my final project for the summer 2015 cohort of Ironhack in Barcelona.

I created a webapp using Ruby on Rails, JavaScript with jQuery, HTML5, CSS3 and Twitter's Bootstrap. Given we only had two weeks to complete the project, there is still an endless list of features that I would like to implement.

This app wants to be an easy tool to agree with people about activities to do. It allows to come with different plan ideas in a collaborative way. Then the group is able to vote and decide what, when and where to make the plan happen.

Main features:

- Create a group to share ideas.

- Invite people to join the group.

- Add ideas of plans to the group.

- Make opened/closed plans in terms of when and where to do it.

- Sign for plans you can attend.

- Choose the scheduling and places that work for you.


Check it out in www.plansandfriends.com


### Landing page
------------------


### User home
------------------


### Group view
------------------


### Plan view
------------------


## Instructions to make it run:
------------------
If you'd like to clone the app and make it your own...

clone the project:
```
git clone https://github.com/andreumasferrer/IH_Project.git
```
install the ruby dependencies:
```
bundle install
```
create the database: *(make sure you have Postgresql installed and running)*
```
rake db:create
```
run the migrations:
```
rake db:migrate
```
run the server
```
rails s
```

to run the specs:
````
rake spec
```

Have fun!
