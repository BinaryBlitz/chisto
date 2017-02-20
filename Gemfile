source 'https://rubygems.org'

ruby '~> 2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster.
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease.
gem 'jbuilder', '~> 2.5'

# Front-end
gem 'slim-rails'
gem 'bootstrap', '~> 4.0.0.alpha6'

# Utilities
gem 'phonelib', '~> 0.6'
gem 'email_validator', '~> 1.6'
gem 'httparty', '~> 0.14'
gem 'biz', '~> 1.6'

# Image processing
gem 'carrierwave', '~> 1.0'
gem 'mini_magick', '~> 4.6'

# I18n
gem 'rails-i18n', '~> 5.0'

# Auth
gem 'devise', '~> 4.2'
gem 'devise-bootstrap-views', '~> 1.0.0.alpha1'

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
  gem 'annotate'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background.
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Pry
  gem 'pry-rails'
end

group :production do
  gem 'fog-aws', '~> 1.2'
  gem 'redis-rails', '~> 5.0'
  gem 'sidekiq', '~> 4.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
