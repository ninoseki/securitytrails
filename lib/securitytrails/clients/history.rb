# frozen_string_literal: true

module SecurityTrails
  module Clients
    class History < Client
      #
      # Lists out specific historical information about the given hostname parameter
      #
      # @see https://docs.securitytrails.com/reference#dns-history-by-record-type
      #
      # @param [String] hostname
      # @param [String] type allowed values: a, aaaa, mx, ns, soa or txt
      # @param [Integer] page The page of the returned results
      #
      # @return [Hash]
      #
      def get_dns_history(hostname, type:, page: 1)
        raise ArgumentError, "The API currently supports a, aaaa, mx, ns, soa and txt records." unless valid_type?(type)

        get("/history/#{hostname}/dns/#{type.downcase}", page: page) { |json| json }
      end

      #
      # Lists out specific historical information about the given hostname parameter with auto paging
      #
      # @see https://docs.securitytrails.com/reference#dns-history-by-record-type
      #
      # @param [String] hostname
      # @param [String] type allowed values: a, aaaa, mx, ns, soa or txt
      #
      # @return [Hash]
      #
      def get_all_dns_history(hostname, type:)
        first_page = get_dns_history(hostname, type: type, page: 1)
        pages = first_page["pages"].to_i

        records = []
        records << first_page["records"]

        (2..pages).each do |page_idx|
          next_page = get_dns_history(hostname, type: type, page: page_idx)
          records << next_page["records"]
        end

        first_page["records"] = records.flatten
        first_page
      end

      #
      # Returns historical WHOIS information about the given domain
      #
      # @see https://docs.securitytrails.com/reference#whois-history-by-domain
      #
      # @param [String] hostname
      #
      # @return [Hash]
      #
      def get_whois_history(hostname)
        get("/history/#{hostname}/whois/") { |json| json }
      end

      private

      def valid_type?(type)
        ["a", "aaaa", "mx", "ns", "soa", "txt"].include? type.downcase
      end
    end
  end
end
