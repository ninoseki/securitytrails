# frozen_string_literal: true

module SecurityTrails
  module Clients
    class IPs < Client
      #
      # Returns the neighbors in any given IP level range and essentially allows you to explore closeby IP addresses.
      #
      # @see https://docs.securitytrails.com/reference#explore-ips
      #
      # @param [String] ipaddress Starting IP address (optionally with CIDR subnet mask)
      #
      # @return [Hash]
      #
      def explore(ipaddress)
        get("/ips/nearby/#{ipaddress}") { |json| json }
      end

      #
      # Search IPs (DSL)
      #
      # @see https://docs.securitytrails.com/reference#search-ips-dsl
      #
      # @param [String] query The DSL query you want to run against the IPs database.
      #
      # @return [Hash]
      #
      def search(query)
        post("/ips/list", query: query) { |json| json }
      end

      #
      # IP Search statistics
      #
      # @see https://docs.securitytrails.com/reference#ip-search-statistics
      #
      # @param [String] query
      #
      # @return [Hash]
      #
      def stats(query)
        post("/ips/stats", query: query) { |json| json }
      end

      #
      # Fetch user agents seen for a specific IPv4 address
      #
      # @see https://docs.securitytrails.com/reference#ip-useragents
      #
      # @param [String] ip_address
      #
      # @return [Hash]
      #
      def get_useragents(ip_address)
        get("/ips/#{ip_address}/useragents") { |json| json }
      end

      #
      # Fetch current IP information for a single IPv4 address.
      #
      # @see https://docs.securitytrails.com/reference#ip-whois
      #
      # @param [String] ip_address
      #
      # @return [Hash]
      #
      def get_whois(ip_address)
        get("/ips/#{ip_address}/whois") { |json| json }
      end
    end
  end
end
