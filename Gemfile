source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
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
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'cancancan'
gem 'devise'
gem 'bootstrap-sass'
gem 'semantic-ui-sass'
gem 'figaro'
gem 'carrierwave', '>= 1.0.0.rc', '< 2.0'
gem 'cloudinary'

gem 'dropzonejs-rails'
# gem 'MiniMagick'
gem 'stripe'
gem 'react-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'omniauth-facebook'
gem 'omniauth'
gem 'rails-erd'
gem 'geocoder'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# gem "capybara-webkit"
gem 'simplecov', :require => false, :group => :test

group :development, :test do
	gem 'selenium-webdriver'
	gem 'guard'
	gem 'guard-rspec'
	gem 'database_cleaner'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rails-controller-testing'
	# gem 'rspec-rails'
	gem 'tsuite'
	gem 'factory_girl_rails'
	gem 'pry-byebug'
  # gem 'stripe-ruby-mock', '~> 2.3.1', :require => 'stripe_mock'
end

group :development do
	gem 'codeship'
	gem 'listen'
	gem 'better_errors'
	gem 'binding_of_caller'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
