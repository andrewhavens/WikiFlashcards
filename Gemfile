source 'http://rubygems.org'

#server
gem 'thin'

gem 'rails', '3.1.0'
group :assets do
  gem 'sass-rails', "~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end
gem 'jquery-rails'

group :development, :test do
	gem 'sqlite3-ruby', :require => 'sqlite3'
end
group :production do
  gem 'pg'
end

gem 'rack-mobile-detect', :require => 'rack/mobile-detect'

#authentication gems
gem "devise"
gem "oa-oauth", :require => "omniauth/oauth"

#image uploading
gem 'paperclip'

#version history
gem 'paper_trail', '2.2.9'

