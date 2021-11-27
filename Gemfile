# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'interactor-rails', '~> 2.0'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'sqlite3', '~> 1.4'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'brakeman'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rubocop', '~> 1.23'
  gem 'rubocop-performance', '~> 1.12'
  gem 'rubocop-rails', '~> 2.12'
  gem 'rubocop-rspec', '~> 2.6'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'spring'
end

group :test do
  gem 'database_cleaner-active_record'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
