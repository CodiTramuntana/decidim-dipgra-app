# frozen_string_literal: true

require "rails"
require "active_support/all"

require "decidim/core"

module Decidim
  module DigraCensusAuthorization
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::DigraCensusAuthorization

      initializer "decidim_digra_census_authorization.add_authorization_handlers" do |_app|
        Decidim::Verifications.register_workflow(
          :digra_census_authorization_handler
        ) do |auth|
          auth.form = "DigraCensusAuthorizationHandler"
        end
      end
    end
  end
end
