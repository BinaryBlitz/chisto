source 'https://rubygems.org'

ruby '~> 3.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster.
gem 'turbolinks', '~> 5.0'
# Build JSON APIs with ease.
gem 'jbuilder', '~> 2.5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Front-end
gem 'slim-rails'
gem 'bootstrap', '~> 4.0'

# Utilities
gem 'phonelib', '~> 0.6'
gem 'email_validator', '~> 1.6'
gem 'httparty', '~> 0.14'
gem 'biz', '~> 1.6'

# Image processing
gem 'carrierwave', '~> 1.0'
gem 'mini_magick', '~> 4.6'

# I18n
gem 'rails-i18n', '~> 6.0'

# Auth
gem 'devise', '~> 4.3'
gem 'devise-bootstrap-views', '~> 1.1.0'

# Payments
gem 'tinkoff', '~> 0.1'

# Error logging
gem 'rollbar', '~> 2.14'

# Push notifications
gem 'houston', '~> 2.2'
gem 'gcm', '~> 0.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Schema annotations for models, tests, etc.
  gem 'annotate'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0'
  # Pry
  gem 'pry-rails'
end

group :production do
  # AWS adapter for CarrierWave
  gem 'fog-aws', '~> 1.2'
  # Use Redis for caching and background jobs
  gem 'redis-rails', '~> 5.0'
  # ActiveJob adapter
  gem 'sidekiq', '~> 5.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
