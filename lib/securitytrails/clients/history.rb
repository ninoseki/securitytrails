# frozen_string_literal: true

module SecurityTrails
  module Clients
    class History < Client
      def get_dns_history(hostname, type, page = 1)
        get("/history/#{hostname}/dns/#{type.downcase}", page: page) { |json| json }
      end

      def get_all_dns_history(hostname, type)
        first_page = get_dns_history(hostname, type, 1)
        pages = first_page["pages"].to_i

        records = []
        records << first_page["records"]

        (2..pages).each do |page_idx|
          next_page = get_dns_history(hostname, type, page_idx)
          records << next_page["records"]
        end

        first_page["records"] = records.flatten
        first_page
      end

      def get_whois_history(hostname)
        get("/history/#{hostname}/whois/") { |json| json }
      end
    end
  end
end
