# frozen_string_literal: true

module SecurityTrails
  class API
    attr_reader :domain
    attr_reader :domains
    attr_reader :history
    attr_reader :ips

    def initialize(api_key = ENV["SECURITYTRAILS_API_KEY"])
      raise(ArgumentError, "'api_key' argument is required") unless api_key

      @domain   = Clients::Domain.new(api_key)
      @domains  = Clients::Domains.new(api_key)
      @history  = Clients::History.new(api_key)
      @ips      = Clients::IPs.new(api_key)
    end
  end
end
