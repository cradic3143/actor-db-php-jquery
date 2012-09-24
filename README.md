# Basic PHP and jQuery app for actor database

This is just an exploration of using PHP, MySQL, and JavaScript/jQuery to query
an actor's database called **sakila** found on the [MySQL Dev website](http://dev.mysql.com/doc/index-other.html). 
This app uses ajax calls to bypass page refresh to provide seamless access to
actor's information.

## Demo

View working version here: http://actorsearch-design48.herokuapp.com/

## Notes

* uses PHP's PDO (PHP Data Objects) extension to provide interface for for accessing
  a MySQL database
* basic PHP template for page re-use
* fallback if JavaScript is not enabled
* twitter bootstrap for basic preset styling 
* CoffeeScript for javascript fun https://github.com/design48/actor-db-php-jquery/blob/master/js/scripts.coffee
* http://www.heroku.com cloud app platform for ease of deployment via git 

## Tech Notes

* had issues migrating MySQL database from local to cloud. Was getting access denied issues regarding `TRIGGERS` and `FUNCTIONS` defined that needed **SUPER** privilege access. 
* For import onto demo database, I manually deleted those triggers and functions as I was not going to be doing any inserts, just querying for display

## Screenshots

![index](http://content.screencast.com/users/User48/folders/Jing/media/ccbea974-7096-47b8-a258-6163020c3665/00000051.png)

![selection](http://content.screencast.com/users/User48/folders/Jing/media/a294301a-9c7c-465a-b5b6-7317c5893af4/00000052.png)

![detail](http://content.screencast.com/users/User48/folders/Jing/media/4435e7e1-0f65-449b-97d7-db5f52fe5c08/00000053.png)
