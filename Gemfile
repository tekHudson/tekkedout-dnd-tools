source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'pg'
gem 'sprockets-rails'
gem 'rails', '~> 5.1'
gem 'puma', '~> 3.0'
gem 'turbolinks', '~> 5'

# Styling
gem 'sass-rails'
gem 'twitter-bootstrap-rails-confirm'
gem 'bootstrap-datepicker-rails'
gem 'bootstrap', '~> 4.1.1'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-guardsjs-rails', '~> 0.4'

# Devise
gem 'devise'
gem 'devise-bootstrap-views'
gem 'email_validator'

# tmpl wrapper
gem 'blueimp-templates-rails'

# JavaScript
gem 'jquery-rails'
gem 'select2-rails'

gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'awesome_print'
  gem 'pry-byebug'
  gem 'letter_opener'
  gem 'rb-fsevent', '0.9.8'
  gem 'rubocop', '~> 0.39'
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
