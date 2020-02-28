source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'bcrypt', '3.1.12'
gem 'faker',   '1.7.3'
gem 'image_processing', '~> 1.2'
gem 'bootstrap-sass'
gem 'jquery-rails'
gem "aws-sdk-s3", require: false
gem 'counter_culture'
gem 'will_paginate'
gem 'bootstrap-will_paginate'

gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', require: false
gem 'uglifier',  '~> 3.2'
gem 'coffee-rails', '~> 5.0.0'
gem 'rails-i18n'
gem 'mini_magick'

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug',  '9.0.6', platform: :mri
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'pry-rails'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
end

group :test do
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest',                 '5.13.0'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'mysql2', '>= 0.4.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
