# frozen_string_literal: true

module SecurityTrails
  module Clients
    class Domain < Client
      #
      # Returns the current data about the given domain. In addition to the current data, you also get the current statistics associated with a particular record. For example, for a records you'll get how many other domains have the same IP.
      #
      # @see https://docs.securitytrails.com/reference#get-domain
      #
      # @param [String] hostname
      #
      # @return [Hash]
      #
      def get_by_hostname(hostname)
        get("/domain/#{hostname}") { |json| json }
      end

      #
      # Returns subdomains for a given hostname
      #
      # @see https://docs.securitytrails.com/reference#list-subdomains
      #
      # @param [String] hostname
      #
      # @return [Hash]
      #
      def get_subdomains(hostname)
        get("/domain/#{hostname}/subdomains") { |json| json }
      end

      #
      # Returns tags for a given hostname
      #
      # @see https://docs.securitytrails.com/reference#list-tags
      #
      # @param [String] hostname
      #
      # @return [Hash]
      #
      def get_tags(hostname)
        get("/domain/#{hostname}/tags") { |json| json }
      end

      #
      # Find all domains that are related to a domain you input
      #
      # @see https://docs.securitytrails.com/reference#find-associated-domains
      #
      # @param [String] hostname
      #
      # @return [Hash]
      #
      def get_associated_domains(hostname)
        get("/domain/#{hostname}/associated") { |json| json }
      end

      #
      # Returns the current WHOIS data about a given domain with the stats merged together
      #
      # @see https://docs.securitytrails.com/reference#get-whois
      #
      # @param [String] hostname
      #
      # @return [Hash]
      #
      def get_whois(hostname)
        get("/domain/#{hostname}/whois") { |json| json }
      end
    end
  end
end
