# frozen_string_literal: true

require "virtus/multiparams"

# An AuthorizationHandler that uses the DigraCensusAuthorizationService to create authorizations
class DigraCensusAuthorizationHandler < Decidim::AuthorizationHandler
  include Virtus::Multiparams

  DOCUMENT_TYPE = {
    "nif" => "1",
    "passport" => "2",
    "residence_card" => "3",
    "dni" => "6"
  }.freeze

  # This is the input (from the user) to validate against
  attribute :document_type, Symbol
  attribute :id_document, String
  attribute :birthdate, Date

  # This is the validation to perform
  # If passed, is authorized
  validates :document_type, inclusion: { in: [:nif, :passport, :residence_card, :dni] }, presence: true
  validates :id_document, presence: true
  validates :birthdate, presence: true
  validate :censed

  def metadata
    { birthdate: birthdate.strftime("%Y/%m/%d") }
  end

  def census_document_types
    [:nif, :passport, :residence_card, :dni].map do |type|
      [
        I18n.t(type, scope: %w(decidim authorization_handlers
                               digra_census_authorization_handler
                               document_types)),
        type
      ]
    end
  end

  # Checks if the id_document belongs to the census
  def censed
    if census_for_user.nil?
      errors.add(:id_document, I18n.t("decidim.census.errors.messages.not_censed"))
    elsif census_for_user.birthdate != birthdate
      errors.add(:birthdate, I18n.t("decidim.census.errors.messages.invalid_credentials"))
    end
  end

  def unique_id
    return unless census_for_user

    Digest::SHA256.hexdigest(
      "#{census_for_user.id_document}-#{Rails.application.secrets.secret_key_base}"
    )
  end

  def census_for_user
    return @census_for_user if defined? @census_for_user
    return unless organization

    @service = DigraCensusAuthorization.new(api_config[:username], api_config[:password], organization)
    @census_for_user = @service.call(
      birthdate: birthdate,
      document_type: DOCUMENT_TYPE[document_type],
      id_document: id_document
    )
  end

  private

  def api_config
    {
      username: "#{organization.ine_code}#{DigraCensusAuthorizationConfig.username}",
      password: DigraCensusAuthorizationConfig.password
    }
  end

  def organization
    current_organization || user.try(:organization)
  end
end
