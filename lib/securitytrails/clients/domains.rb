# frozen_string_literal: true

module SecurityTrails
  module Clients
    class Domains < Client
      #
      # Filter and search specific records using this endpoint.
      #
      # @see https://docs.securitytrails.com/reference#domain-search
      #
      # @param [Hash] **params
      #
      # @return [Hash]
      #
      def search(**params)
        post("/domains/list", params) { |json| json }
      end

      #
      # Search statistics
      #
      # @see https://docs.securitytrails.com/reference#search-count
      #
      # @param [Hash] **params
      #
      # @return [Hash]
      #
      def stats(**params)
        post("/domains/stats", params) { |json| json }
      end
    end
  end
end
