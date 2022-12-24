source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "rails"
gem "propshaft"
gem "pg"
gem "puma"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "redis"

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
  gem "standard"
end

group :development do
  gem "web-console"
  gem "letter_opener"
end

group :test do
  gem "shoulda-matchers"
  gem "simplecov"
end
