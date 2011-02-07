source :rubygems

gem "rails", ">= 3.0.3"
gem "rack"
gem "clearance", "0.9.1"
gem "haml"
gem "high_voltage"
gem "RedCloth", :require => "redcloth"
gem "paperclip"
gem "will_paginate"
gem "validation_reflection"
gem "formtastic"
gem "mysql"
gem "flutie"
gem "dynamic_form"
gem "newrelic_rpm"
gem "foreigner"
gem "transitions", :require => ["transitions", "active_record/transitions"]

# RSpec needs to be in :development group to expose generators
# and rake tasks without having to type RAILS_ENV=test.
group :development, :test do
  gem "rspec-rails", "~> 2.4.0"
  gem "ruby-debug",   :platforms => :mri_18
  gem "ruby-debug19", :platforms => :mri_19
end

group :test do
  gem "cucumber-rails", :git => "https://github.com/johnf/cucumber-rails.git"
  gem "factory_girl_rails"
  gem "bourne"
  gem "capybara", "~> 0.4.0"
  gem "database_cleaner"
  gem "fakeweb"
  gem "sham_rack"
  gem "nokogiri"
  gem "timecop"
  gem "treetop"
  gem "shoulda"
  gem "launchy"
  gem "akephalos"
  gem "thin"
  gem "spork", '~> 0.9.0.rc3'
end
