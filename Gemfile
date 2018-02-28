source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'
gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'haml-rails'
gem 'sass-rails', '~> 5.0'
gem 'materialize-sass', '~> 1.0.0.alpha4'
gem "font-awesome-rails"
gem 'uglifier', '>= 1.3.0'
gem 'administrate'
gem 'paperclip'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'gravtastic'
gem 'aws-sdk'
gem 'brewery_db'
gem 'kaminari'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Devise
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

# Rolify and CanCan
gem 'cancancan'
gem 'rolify'

# gem 'capistrano-rails', group: :development
# Use Capistrano for deployment

group :development, :test do
  gem 'dotenv-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara-webkit'
  gem "factory_bot_rails", "~> 4.0"
  gem 'ffaker'
  gem 'rails-controller-testing'
end

group :test do
  gem "chromedriver-helper"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'dotenv-rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'dotenv-rails'
end
