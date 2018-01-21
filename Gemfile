source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'geocoder'
gem 'dotenv-rails'
gem 'rails-assets-gmaps', source: 'https://rails-assets.org'
gem 'jquery-rails'
gem 'bootstrap', '~> 4.0'
gem 'acts_as_shopping_cart'
gem 'stripe'


group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'launchy'
  gem 'coveralls', require: false
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'webmock'
  gem 'stripe-ruby-mock', '~> 2.5', require: 'stripe_mock'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
