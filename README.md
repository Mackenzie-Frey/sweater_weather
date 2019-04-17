# README

## Description
Sweater Weather is a 5-day, solo project during module three, of Turing School's Back-End Engineering Program.

Sweater Weather is a web application designed to consume and produce API's. The application utilizes Ruby on Rails, with a PostgrSQL database, to consume the Dark Sky API for weather, the Google Maps API for geocoding, and the Unsplash API for city images.

#### [**_View Sweater Weather in Production_**](https://weather-for-sweaters.herokuapp.com/) </br>

<img width="1389" alt="Wireframe of Sweater Weather" src="http://backend.turing.io/module3/projects/images/sweater_weather/root.png">

## Getting Started

To run Sweater Weather on your local machine, navigate to the directory in which you would like the project to be located in, then execute the following commands:

```
$ git clone git@github.com:Mackenzie-Frey/sweater_weather.git
$ cd sweater_weather
$ bundle
$ rails g rspec:install
$ bundle exec figaro install
```
#### Setup your environment variables:

##### Sign Up for the following API's:
* [Dark Sky](https://darksky.net/dev)
* [Google Maps](https://developers.google.com/maps/documentation/javascript/get-api-key)
* [Unsplash](https://unsplash.com/developers)


Add the following code snippet to your `config/application.yml` file. Make sure to insert the key/secret without the alligator clips ( < > ).
```
dark_sky_key: <insert>
google_maps_key: <insert>
unsplash_client_id: <insert>
unsplash_client_secret: <insert>
amypode_key: oscar_the_grouch
```

## Running Tests

To run the test suite, execute the following command: `rspec`.

## Deployment

To view Sweater Weather in development, execute the following command from the project directory: `rails s`. To view the application in a web browser, visit `localhost:3000`.

To view the application in production, from the project directory, execute the following commands:
```
$ createuser -s -r sweater_weather
$ RAILS_ENV=production rake db:{drop,create,migrate}
$ rake assets:precompile
$ rails s -e production
```

## Available Endpoints
```
GET /api/v1/forecast?location=<location name ie denver,co>
GET /api/v1/backgrounds?location=<location name>
GET /api/v1/antipode?loc=hongkong
POST /api/v1/users, params: { email: example@email.com, password: password123, password_confirmation: password123 }
POST /api/v1/sessions, params: { email: example@email.com, password: password123 }
POST /api/v1/favorites, body: {"location": "Denver, CO", "api_key": "jgn983hy48thw9begh98h4539h4"}
GET /api/v1/favorites, body: {"api_key": "jgn983hy48thw9begh98h4539h4"}
DELETE /api/v1/favorites, body: {"location": "Denver, CO", "api_key": "jgn983hy48thw9begh98h4539h4"}
```

## Tools
* Fast JSON API
* Dark Sky API
* Google Maps API
* Unsplash Image API
* Postman
* Faraday
* Figaro
* GitHub Projects
* RSpec
* Capybara
* Pry
* SimpleCov

## Rubric/Project Description
#### [**_View the Project Description and Rubric_**]http://backend.turing.io/module3/projects/sweater_weather

## Author
[Mackenzie Frey](https://github.com/Mackenzie-Frey)
