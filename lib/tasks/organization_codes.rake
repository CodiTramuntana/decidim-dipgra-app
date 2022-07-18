# frozen_string_literal: true

require "csv"

namespace :organization_codes do
  task load_codes: [:load_municipality_codes, :load_ine_codes]

  desc "Set municipality code in organization"
  task load_municipality_codes: :environment do
    puts "Load MUNICIPALITY codes in organizations\n"

    csv_text = File.read("lib/assets/municipality_codes.csv")
    csv = CSV.parse(csv_text, headers: false)

    csv.each do |row|
      organization = Decidim::Organization.find_by("lower(name) = ?", row[1].downcase)

      if organization.present?
        organization.municipality_code = row[0]
        organization.save
        puts "Organization #{organization.name} associated with code #{row[0]}"
      else
        puts "Organization #{row[1]} not found"
      end
    end
  end

  desc "Set ine code in organization"
  task load_ine_codes: :environment do
    puts "Load INE codes in organizations\n"

    csv_text = File.read("lib/assets/ine_codes.csv")
    csv = CSV.parse(csv_text, headers: false)

    csv.each do |row|
      organization = Decidim::Organization.find_by("lower(name) = ?", row[1].downcase)

      if organization.present?
        organization.ine_code = row[0]
        organization.save
        puts "Organization #{organization.name} associated with code #{row[0]}"
      else
        puts "Organization #{row[1]} not found"
      end
    end
  end
end
