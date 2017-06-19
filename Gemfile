source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.3"
gem "pg"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"

gem "sprockets-rails"
gem "turbolinks", "~> 5"
gem "puma", "~> 3.0"

gem "bootstrap-sass", "~> 3.3"
gem "bootstrap-datepicker-rails"
gem "bootstrap-guardsjs-rails", "~> 0.4"
gem "twitter-bootstrap-rails-confirm"
gem "jquery-datatables-rails", "~> 3.3.0"

gem "blueimp-templates-rails"

gem "jquery-rails"
gem "jbuilder", "~> 2.5"
gem "select2-rails"

group :development, :test do
  gem "byebug", platform: :mri
end

group :development do
  gem "better_errors"
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
