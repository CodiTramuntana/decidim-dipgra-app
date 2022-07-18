# frozen_string_literal: true

class DigraCensusAuthorizationConfig
  class << self
    def url
      Rails.application.secrets.digra_census[:url]
    end

    def username
      Rails.application.secrets.digra_census[:username]
    end

    def password
      Rails.application.secrets.digra_census[:password]
    end

    def public_key
      Rails.application.secrets.digra_census[:public_key]
    end
  end
end
