source 'https://rubygems.org'

group :development, :production, :test do
  gem 'sinatra', '3.0.4' , require: 'sinatra/base'
  gem 'mongoid', '7.0.1'
  gem 'arkaan' , '2.7.1'
  gem 'draper' , '3.1.0'
end

group :developement, :production do
  gem 'rake'
  gem 'capistrano'        , '3.11.0'
  gem 'capistrano-bundler', '1.5.0'
  gem 'capistrano-rvm'    , '0.1.1'
end

group :development, :test do
  gem 'pry'             , '0.11.1'
  gem 'rack-test'       , '0.7.0' , require: 'rack/test'
  gem 'rspec'           , '3.6.0'
  gem 'factory_girl'    , '4.8.1'
  gem 'simplecov'       , '0.15.1'
  gem 'database_cleaner', '1.6.1'
  gem 'bcrypt'          , '3.1.11'
  gem 'rubocop'         , '0.73.0'
end