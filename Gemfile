source 'https://rubygems.org'

ruby "2.3.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'rails_12factor', '~> 0.0.3'
# Use PUMA web server
gem 'puma', '~> 3.4'
# Use Figaro for secure config variables
gem 'figaro', '~> 1.1', '>= 1.1.1'
# Use Bootstrap-Sass
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'bootstrap_form', '~> 2.3'
# Use Devise for User Authentication
gem 'devise', '~> 3.5', '>= 3.5.6'
# Make the URLs much nicer
gem 'friendly_id', '~> 5.1'
# Use for pagination
gem 'will_paginate', '~> 3.1'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1'
# Use for search
gem 'ransack', '~> 1.7'
# Use for rendering dates and times
gem 'local_time', '>= 1.0.3'
# Use for Stripe payments
gem 'stripe', '~> 1.40'
gem 'stripe_event', '~> 1.5'

# Use for Voting on Models
gem 'acts_as_votable', '~> 0.10.0'

group :test do
    gem "capybara"
    gem 'capybara_minitest_spec', '~> 1.0', '>= 1.0.5'
    gem "connection_pool"
    gem "launchy"
    gem "minitest-reporters"
    gem "mocha"
    gem "poltergeist"
    gem "shoulda-context"
    gem "shoulda-matchers", ">= 3.0.1"
    gem "test_after_commit"
    gem "simplecov", require: false
    gem 'stripe-ruby-mock', '~> 2.2.4', :require => 'stripe_mock'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
    gem 'better_errors', '~> 2.1', '>= 2.1.1'
    gem 'binding_of_caller', '~> 0.7.2'
    gem 'annotate', '~> 2.7'
    # Access an IRB console on exception pages or by using <%= console %> in views
    gem 'web-console', '~> 2.0'

    # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
    gem 'spring'
    gem 'guard', '~> 2.13'
    gem 'guard-minitest', '~> 2.4', '>= 2.4.4'
    gem "rb-fsevent", :require => false
    gem "terminal-notifier-guard", :require => false
    gem 'minitest-colorize', git: 'https://github.com/ysbaddaden/minitest-colorize'
end
