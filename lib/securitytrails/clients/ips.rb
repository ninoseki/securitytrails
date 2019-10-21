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
    end
  end
end
