# frozen_string_literal: true

module SecurityTrails
  module Clients
    class General < Client
      #
      # You can use this simple endpoint to test your authentication and access to the SecurityTrails API.
      #
      # @see https://docs.securitytrails.com/reference#ping
      #
      # @return [Hash]
      #
      def ping
        get("/ping") { |json| json }
      end

      #
      # Usage
      #
      # @see https://docs.securitytrails.com/reference#usage
      #
      # @return [Hash]
      #
      def usage
        get("/account/usage") { |json| json }
      end

      #
      # A fast and easy way to fetch many results. Currently only available for the DSL API endpoints.
      #
      # @see https://docs.securitytrails.com/reference#scroll
      #
      # @param [String] The scroll_id returned in the scroll request.
      #
      # @return [Hash]
      #
      def scroll(scroll_id)
        get("/scroll/#{scroll_id}") { |json| json }
      end
    end
  end
end
