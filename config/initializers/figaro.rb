# frozen_string_literal: true

env = Rails.env
keys = %w(SECRET_KEY_BASE)
keys += %w(DB_DATABASE DB_PASSWORD DB_USERNAME)
unless env.development? || env.test?
  keys += %w(MAILER_SMTP_ADDRESS MAILER_SMTP_DOMAIN MAILER_SMTP_PORT MAILER_SMTP_USER_NAME)
  keys += %w(GEOCODER_LOOKUP_API_KEY)
  keys += %w(DIPGRA_CENSUS_URL DIPGRA_CENSUS_PASSWORD DIPGRA_CENSUS_USERNAME DIPGRA_CENSUS_PUBLIC_KEY)
end
Figaro.require_keys(keys)
