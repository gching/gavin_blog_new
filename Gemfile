source 'https://rubygems.org'
ruby "2.0.0"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Use postgresql
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'



################## Styling #####################
## Foundation 4
#gem 'zurb-foundation'
## Foundation 5
 gem 'foundation-rails'
## Font icons for Foundation
gem 'foundation-icons-sass-rails'
###############################################

## To configure environment constants
gem 'figaro'

## To properly set up assets for Heroku with Rails 4 --Ck_editor does not work
gem 'rails_12factor', group: :production

## Gem to incorporate hashtags
gem 'twitter-text'

# For backend admin dashboard
gem 'rails_admin'
# Editor for chapters.
gem 'ckeditor'

## Used to upload files to AWS
gem "carrierwave"

## Used to handle image converting and uploading
gem "mini_magick", '~> 3.8.0'

## Helps with connection with AWS.
gem 'fog', '~> 1.24.0'#, :git => 'https://github.com/fog/fog.git'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'
gem 'faker', "~> 1.1.2"


# Use unicorn as the app server
gem 'unicorn'

## Deployment - Capistrano
gem 'capistrano', '~> 3.2.0'
gem 'capistrano-rails'
gem 'capistrano-rvm'

## Use devise for a simple easy user setup
gem "devise"


## Use new relic to monitor blog.
gem 'newrelic_rpm'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  ## Below are used for testing
  gem 'rspec-rails',  '~> 2.14.0'
  gem 'rspec-nc'
  gem 'factory_girl_rails', '~> 4.2.1', :require => false
  ## Add it to bundle as guard-rails requires it to use.
  gem 'zeus'
  gem 'capybara', '~> 2.1.0'
  gem 'database_cleaner'
end

group :test do
  ## Used for browser automation and coverage
  gem 'selenium-webdriver'
  gem 'simplecov'
end

group :development do
  ## Used for testing and shell
  gem 'pry'
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'guard-rails'
  gem 'guard-rspec', require: false

  gem 'rack-mini-profiler'
end
