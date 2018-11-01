# frozen_string_literal: true

module SecurityTrails
  module Clients
    class IPs < Client
      def explore(ipaddress)
        get("/ips/nearby/#{ipaddress}") { |json| json }
      end

      def search(query)
        post("/ips/list", query: query) { |json| json }
      end

      def stats(query)
        post("/ips/stats", query: query) { |json| json }
      end
    end
  end
end
