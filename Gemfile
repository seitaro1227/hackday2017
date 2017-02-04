source 'https://rubygems.org'

gem 'rails', '5.0.1'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'therubyracer'

# UI/UX
gem 'jquery-rails'
# gem 'turbolinks'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'coffee-rails'
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails'
gem 'jbuilder', '~> 2.0'

# Authentication
gem 'sorcery'
gem 'pundit'

# Configuration
gem 'dotenv-rails'
gem 'config', '~> 1.0.0'

# Database
gem 'pg'
gem 'redis-rails'

# Seeds
gem 'seed-fu'

# Search/Pagination
gem 'kaminari'
gem 'ransack'

# Breadcrumbs
gem 'gretel'

# Form
gem 'simple_form'
gem 'nested_form'

# Soft delete
gem 'paranoia'
gem 'paranoia_uniqueness_validator'

# Model
gem 'active_hash'
gem 'virtus'

# Validation
gem 'validates_email_format_of'
gem 'validate_url'

# Decorator
gem 'active_decorator'

# Application server
gem 'puma'

# Background Job
gem 'resque'
gem 'resque-scheduler'
gem 'active_scheduler'

# Scraping
gem 'capybara-mechanize'

# Debugger
group :development do
  gem 'web-console', '~> 2.0'
  gem 'listen'
end

# Heroku
group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'

  # Email
  gem 'letter_opener_web'

  # CLI
  gem 'spring'
  gem 'spring-commands-rspec'

  # Test
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false

  # Code analyze
  gem 'rubocop', '~> 0.39'
  gem 'reek', '~> 4.0'
  gem 'rails_best_practices'
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'coffeelint'
  gem 'scss_lint', require: false

  # Debugger
  gem 'byebug'
  gem 'better_errors'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'

  # Print debug
  gem 'awesome_print'
  gem 'tapp'

  # Table/Schema
  gem 'annotate'
  gem 'migration_comments'

  # Deploy
  gem 'capistrano', '3.5.0'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano3-puma'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'faker'
  gem 'fuubar'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'timecop'
end
