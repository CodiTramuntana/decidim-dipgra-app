# frozen_string_literal: true

class DigraCensusAuthorization
  DigraCensusData = Struct.new(:document_type, :id_document, :birthdate)

  def initialize(username, password, organization)
    @username = username
    @password = password
    @organization = organization
  end

  def call(document_type:, id_document:, birthdate:)
    request = build_request
    raw_response = request.send_rq(document_type: document_type, id_document: id_document, birthdate: birthdate)
    response = DigraCensusAuthorizationRs.new(raw_response)
    return unless response.birth_date.present? && response.active?

    DigraCensusData.new(document_type, id_document, response.birth_date)
  end

  private

  def build_request
    DigraCensusAuthorizationRq.new(@username, @password, @organization)
  end
end
