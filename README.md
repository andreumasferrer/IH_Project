# Plans & Friends

Plans&Friends is my final project for the summer 2015 cohort of Ironhack in Barcelona.

<p align="center">
	<a href="http://www.ironhack.com" target="_blank">
		<img src="http://i65.tinypic.com/2m6k95g.jpg" border="0" alt="Ironhack logo">
	</a>
</p>

>_**Ironhack** is an immersive bootcamp with locations in Madrid, Barcelona, and Miami, offering intensive 8-week courses in Web Development and Mobile iOS development._ [More info.](http://www.ironhack.com)


I created a webapp using Ruby on Rails, JavaScript with jQuery, HTML5, CSS3 and Twitter's Bootstrap. Given we only had two weeks to complete the project, there is still an endless list of features ~~that I would like to implement~~. _**Update:** I will no longer work in this webapp. I'm working in other projects_ ;-)

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
<p align="center">
		<img src="http://i67.tinypic.com/2j33a5w.jpg">
</p>

### User home
------------------
<p align="center">
		<img src="http://i68.tinypic.com/27ytvds.jpg">
</p>


### Group view
------------------
<p align="center">
		<img src="http://i67.tinypic.com/90zk7q.jpg">
</p>

### Plan view
------------------
<p align="center">
		<img src="http://i63.tinypic.com/2v2yw5k.jpg">
</p>


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
