source 'http://rubygems.org'

gem 'rails', '3.0.9'
gem 'rake', "0.9.2"

gem "mysql2", "0.2.7"
gem "rails-settings-cached", :require => "rails-settings"
gem "paperclip", "2.3.11"
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3' 

gem "compass", "~> 0.11.3" 

gem 'themes_for_rails', "0.4.1"
gem "breadcrumbs_on_rails"

# 分页
gem 'kaminari'
gem "meta_search" #NOTE is not compatible with rails 3.0.6

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'  

gem "database_cleaner"

group :development do
  gem "thin", :require => false
  gem "annotate", "2.4.0"
  #　Rails concole support
  gem 'hirb-unicode' # gem 'hirb'
  gem "wirble", "~> 0.1.3" # http://pablotron.org/software/wirble/
  gem "awesome_print", "~> 0.4.0", :require => "ap" # https://github.com/chriseppstein/awesome_print
end

group :test do
  gem "rspec-rails", "~> 2.6"
  gem "shoulda-matchers", "1.0.0.beta2"
end