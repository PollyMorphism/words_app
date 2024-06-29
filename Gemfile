# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.2"

gem "bootsnap", require: false
gem "devise", "~> 4.9"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 6.0"
gem "rails", "~> 7.1.3", ">= 7.1.3.4"
gem "redis", "~> 4.0"
gem "rubocop-rails", require: false
gem "rubocop-rspec", require: false
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "closure_tree"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "web-console"

  gem "mina", require: false
  gem "mina-puma", require: false, github: "untitledkingdom/mina-puma"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
