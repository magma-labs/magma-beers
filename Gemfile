# frozen_literal:true
source 'https://rubygems.org'
ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'administrate'
gem 'aws-sdk'
gem 'aws-sdk-rails'
gem 'brewery_db'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails'
gem 'gravtastic'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'kaminari'
gem 'materialize-sass', '~> 1.0.0.alpha4'
gem 'paperclip'

gem 'pg', '>= 0.18', '< 2.0'
gem 'premailer-rails'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
gem 'sidekiq'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Devise
gem 'devise'
gem 'devise-async'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

# Rolify and CanCan
gem 'cancancan'
gem 'rolify'
gem 'sidekiq-scheduler'

# gem 'capistrano-rails', group: :development
# Use Capistrano for deployment

gem 'dotenv-rails'

gem 'httparty'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-nav'
  gem 'pry-rails'
end

group :development do
  gem 'letter_opener_web', '~> 1.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 2.13'
  gem 'capybara-webkit'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'ffaker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rspec-sidekiq'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
