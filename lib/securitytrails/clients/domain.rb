# frozen_string_literal: true

module SecurityTrails
  module Clients
    class Domain < Client
      def get_by_hostname(hostname)
        get("/domain/#{hostname}") { |json| json }
      end

      def get_subdomains(hostname)
        get("/domain/#{hostname}/subdomains") { |json| json }
      end

      def get_tags(hostname)
        get("/domain/#{hostname}/tags") { |json| json }
      end

      def get_associated_domains(hostname)
        get("/domain/#{hostname}/associated") { |json| json }
      end

      def get_whois(hostname)
        get("/domain/#{hostname}/whois") { |json| json }
      end
    end
  end
end
