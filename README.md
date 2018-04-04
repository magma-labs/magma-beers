[![Build Status](https://travis-ci.org/magma-labs/magma-beers.svg?branch=master)
](https://travis-ci.org/magma-labs/magma-beers)
[![Code Climate](https://codeclimate.com/github/magma-labs/magma-beers.svg)
](https://codeclimate.com/github/magma-labs/magma-beers)
[![Coverage Status](https://coveralls.io/repos/magma-labs/magma-beers/badge.png?branch=master)
](https://coveralls.io/r/magma-labs/magma-beers?branch=master)
[![Inline docs](http://inch-ci.org/github/magma-labs/magma-beers.svg)
](http://inch-ci.org/github/magma-labs/magma-beers)
=========
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

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


