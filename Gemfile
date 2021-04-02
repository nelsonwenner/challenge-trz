source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'active_model_serializers', '~> 0.10.0'
gem 'bootsnap', '>= 1.4.2', require: false

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'rspec-rails', '~> 4.0'
  gem 'faker', '~> 2.15'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'awesome_print', '~> 1.8'
  gem 'pry-rails', '~> 0.3.9'
  gem 'pry', '~> 0.13.1'
  gem 'rswag'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
