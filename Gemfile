source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'chartkick'
gem 'groupdate'
gem 'thor', '0.20.0'

# CSS framework (Bootstrap)
gem 'bootstrap-sass'

# PostgreSQL is used as the database for all environments.
gem 'pg'

# Use jquery as the JavaScript library.
gem 'jquery-rails'

# Turbolinks makes following the links on your web application faster.
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease.
gem 'jbuilder', '~> 2.5'

# Manage user authentication and authorization
gem 'devise'

# Manage environment variables
gem 'figaro'

# Generate fake data to seed
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'

group :development do
  # Access an IRB console on exception pages or by using <%= console %=> in
  # views.
  gem 'web-console', '~> 2.0'
  gem 'listen', '~> 3.0.5'
end
