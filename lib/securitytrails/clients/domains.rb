# frozen_string_literal: true

module SecurityTrails
  module Clients
    class Domains < Client
      def search(**params)
        post("/domains/list", params) { |json| json }
      end

      def stats(**params)
        post("/domains/stats", params) { |json| json }
      end
    end
  end
end
