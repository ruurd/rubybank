source 'https://rubygems.org'
ruby '2.2.2'

# General stuff
gem 'rails'
gem 'i18n'
gem 'haml'
gem 'thin'
gem 'pg'

# rails_config is a gem that adds multi-level configuration to rails
gem 'rails_config'

# money. duh. it's a bank
gem 'money-rails'

# draper is a gem that adds decorators to models.
gem 'draper'

# Authentication...
gem 'devise'
gem 'devise-i18n'

# ... and authorization
gem 'cancancan'

# Views and widgets
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'less-rails'
gem 'railsstrap'
gem 'bootstrap_form'
gem 'kaminari-bootstrap'
gem 'therubyracer'

# admin module.
gem 'rails_admin'

# bullet is a development gem that helps you reduce queries
group :development do
  gem 'bullet'
  gem 'pry'
  gem 'quiet_assets'
  gem 'rubocop'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-test'
  gem 'guard-rubocop'
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'minitest'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

group :doc do
  gem 'sdoc'
end
