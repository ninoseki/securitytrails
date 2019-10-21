# frozen_string_literal: true

module SecurityTrails
  class API
    attr_reader :api_key
    def initialize(api_key = ENV["SECURITYTRAILS_API_KEY"])
      @api_key = api_key
      raise ArgumentError, "'api_key' argument is required" unless api_key
    end

    #
    # Domain API client
    #
    # @return [SecurityTrails::Clients::Domain]
    #
    def domain
      @domain ||= Clients::Domain.new(api_key)
    end

    #
    # Domains API client
    #
    # @return [SecurityTrails::Clients::Domains]
    #
    def domains
      @domains ||= Clients::Domains.new(api_key)
    end

    #
    # History API client
    #
    # @return [SecurityTrails::Clients::History]
    #
    def history
      @history ||= Clients::History.new(api_key)
    end

    #
    # IPs API client
    #
    # @return [SecurityTrails::Clients::IPs]
    #
    def ips
      @ips ||= Clients::IPs.new(api_key)
    end

    #
    # Feed API client
    #
    # @return [SecurityTrails::Clients::Feeds]
    #
    def feeds
      @feeds ||= Clients::Feeds.new(api_key)
    end
  end
end
