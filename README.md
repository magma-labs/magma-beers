Magma Beers [![Build Status](https://travis-ci.org/magma-labs/magma-beers.svg?branch=master)](https://travis-ci.org/magma-labs/magma-beers) [![Code Climate](https://codeclimate.com/github/magma-labs/magma-beers.svg)](https://codeclimate.com/github/magma-labs/magma-beers) [![Coverage Status](https://coveralls.io/repos/github/magma-labs/magma-beers/badge.svg?branch=master)](https://coveralls.io/github/magma-labs/magma-beers?branch=master)  [![Inline docs](http://inch-ci.org/github/magma-labs/magma-beers.svg?branch=master)](http://inch-ci.org/github/magma-labs/magma-beers)
=========

Magma Beers is a web application where you can log and share the beers you drink during the day, also you can see the information bout all beers of the world.

The application allows you to login with OmniAuth with Google and Facebook,

### Getting started

* Install Ruby
  - We recommend to use Rbenv and latest ruby version
  - Install bundler gem 

```
gem install bundler
```
* Necesary drivers
  - Chrome: ChromeDriver `brew install chromedriver`
  - Firefox: geckodriver `brew install geckodriver`
* Clone the project and install the dependencies

```
$ bundle install
```

Next, setup the database:

```
$ rails db:setup
```

Run the seed to generate the admin user for administrate
user: admin@test.com
password: beersadmin

```
$ rails db:seed
```

Finally, run the Rspec test suite to verify that everything is working correctly:

```
$ bundle exec rspec spec
```


### Services (job queues, cache servers, search engines, etc.)

* How to run sidekiq on development

in a terminal tab, run
```
bundle exec sidekiq
```
in another terminal tab, tun 
```
rails server
```
after that, `http://localhost:3000/sidekiq`  will be available
also you can use `http://localhost:3000/emails`  to see the emails
and `http://localhost:3000/rails/mailers`  to see mailer previews

add to **Travis** all required vars for test environment
add to **Heroku** all vars for production environment

and also add the corresponding code for each new var to **app.json**


