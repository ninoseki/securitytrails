# frozen_string_literal: true

module SecurityTrails
  module Clients
    class Feeds < Client
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
