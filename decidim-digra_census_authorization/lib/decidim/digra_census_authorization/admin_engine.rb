# frozen_string_literal: true

module Decidim
  module DigraCensusAuthorization
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::DigraCensusAuthorization::Admin
    end
  end
end
