# frozen_string_literal: true

module SecurityTrails
  module Clients
    class Feeds < Client
      #
      # Fetch zone files including authoritative nameservers with ease
      #
      # @see https://docs.securitytrails.com/reference#domains-1
      #
      # @param [String] type valid values are "all", "dropped", "new" or "registered"
      # @param [String, nil] filter valid values are "cctld" and "gtld"
      # @param [String, nil] tld Can be used to only return domains of a specific tld, such as "com"
      # @param [Boolean, nil] ns show nameservers in the list
      # @param [String, nil] date Date to fetch data for, format YYYY-MM-DD,
      #
      # @return [<Type>] <description>
      #
      def domains(type, filter: nil, tld: nil, ns: nil, date: nil)
        params = { filter: filter, tld: tld, ns: ns, date: date }.compact

        get("/feeds/domains/#{type}", params) do |csv_gz|
          unziped_text = Utility.ungzip(csv_gz)
          unziped_text.lines.map(&:chomp)
        end
      end
    end
  end
end
