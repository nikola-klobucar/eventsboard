source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Rails Default Gems
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'jquery-rails'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

# Essential Gems for Project
gem 'better_errors', '~> 2.9', '>= 2.9.1' # for Debugging
gem 'awesome_print', '~> 1.9', '>= 1.9.2' # for Rails console model display
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1' # for bootstrap styling/ framework
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.7' #for font awesome
gem 'simple_form', '~> 5.1' # for form
gem 'devise', '~> 4.8' # for authentication
gem 'pundit', '~> 2.1' # for authorization
gem 'friendly_id', '~> 5.4', '>= 5.4.2' # for search engine optimization
gem 'carrierwave', '~> 2.2', '>= 2.2.1' # for image upload (depends on fog and mini_magick)
gem 'fog', '~> 2.2' # for cloud deploy of image
gem 'mini_magick', '~> 4.11' # carrierwave dependet
gem 'searchkick', '~> 4.4', '>= 4.4.4' # for search function
gem 'will_paginate', '~> 3.3' # for pagination
gem 'bootstrap-will_paginate', '~> 1.0' # for bootstrap-style pagination

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
