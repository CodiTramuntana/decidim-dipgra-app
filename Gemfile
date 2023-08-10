# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = { git: "https://github.com/CodiTramuntana/decidim.git", branch: "release/0.27-stable" }.freeze

gem "decidim", DECIDIM_VERSION
gem "decidim-dipgra_census_authorization", path: "decidim-dipgra_census_authorization"
gem "decidim-file_authorization_handler", git: "https://github.com/CodiTramuntana/decidim-file_authorization_handler.git", tag: "v0.27.1.2"
gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer.git"

# temporal solution while gems embrace new psych 4 (the default in Ruby 3.1) behavior.
gem "psych", "< 4"

gem "puma"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

gem "figaro", ">= 1.1.1"
gem "openssl"

gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "omniauth-saml", "~> 2.1.0"

gem "deface"

# if deploying to a dedicated server
gem "daemons"
gem "delayed_job_active_record"
gem "whenever"
# elsif deploying to Heroku
# gem "redis"
# gem "sidekiq"
# group :production do
#   gem "fog-aws"
#   gem "rack-ssl-enforcer"
#   gem "rails_12factor"
# end
# endif

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bootsnap"
  gem "byebug", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem "faker"
end

group :development do
  gem "letter_opener_web"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end
