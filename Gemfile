source 'https://rubygems.org'
ruby "3.1.2"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'pg'
gem 'sprockets-rails'
gem 'rails', '~> 6.1'
gem 'globalid'
gem 'puma'
gem 'turbolinks'

# Styling
gem 'sass-rails'
gem 'twitter-bootstrap-rails-confirm'
gem 'bootstrap-datepicker-rails'
gem 'bootstrap'
gem 'coffee-rails'
gem 'uglifier'
gem 'bootstrap-guardsjs-rails'

# Devise
gem 'devise'
gem 'devise-bootstrap-views'
gem 'email_validator'

# tmpl wrapper
# gem 'blueimp-templates-rails'

# JavaScript
gem 'jquery-rails'
gem 'select2-rails'

gem 'jbuilder'

group :development, :test do
  gem 'awesome_print'
  gem 'pry-byebug'
  gem 'letter_opener'
  gem 'rb-fsevent', '0.9.8'
  gem 'rubocop', '~> 0.39'

  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
end

group :development do
  gem 'better_errors'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'mailgun-ruby'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
