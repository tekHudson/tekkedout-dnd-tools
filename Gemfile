source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pg"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.3"
gem "sprockets-rails"
gem "turbolinks", "~> 5"

# Styling
gem "bootstrap-datepicker-rails"
gem "bootstrap-guardsjs-rails", "~> 0.4"
gem "bootstrap-sass", "~> 3.3"
gem "coffee-rails", "~> 4.2"
gem "jquery-datatables-rails", "~> 3.4"
gem "sass-rails", "~> 5.0"
gem "twitter-bootstrap-rails-confirm"
gem "uglifier", ">= 1.3.0"

# Devise
gem "devise"
gem "devise-bootstrap-views"
gem "devise_security_extension"
gem "email_validator"

# tmpl wrapper
gem "blueimp-templates-rails"

# JavaScript
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "select2-rails"

group :development, :test do
  gem "byebug", platform: :mri
  gem "letter_opener"
  gem "rubocop", "~> 0.39"
end

group :development do
  gem "better_errors"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :production do
  gem "mailgun-ruby"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
