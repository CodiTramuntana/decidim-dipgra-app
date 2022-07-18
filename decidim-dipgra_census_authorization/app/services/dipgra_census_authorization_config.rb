# frozen_string_literal: true

class DipgraCensusAuthorizationConfig
  class << self
    def url
      Rails.application.secrets.dipgra_census[:url]
    end

    def username
      Rails.application.secrets.dipgra_census[:username]
    end

    def password
      Rails.application.secrets.dipgra_census[:password]
    end

    def public_key
      Rails.application.secrets.dipgra_census[:public_key]
    end
  end
end
