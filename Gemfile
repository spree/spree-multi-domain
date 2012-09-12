source 'http://rubygems.org'

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end

gemspec

# When spree gem bumps, move dep to 1.2.
#gem 'spree', '~> 1.2'
gem 'spree', :git => 'git://github.com/spree/spree.git', :branch => '1-2-stable'

gem 'ffaker'
