source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'minitest-rails'
gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails',
                              github: 'anjlab/bootstrap-rails',
                              branch: '3.0.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :developemnt, :test do
  gem "minitest-rails-capybara"
  gem 'simplecov', require: false
  gem 'launchy'
  gem 'pry-rails'
end

group :production do
  gem 'pg'
end
