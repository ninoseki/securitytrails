# frozen_string_literal: true

require "json"
require "net/https"

module SecurityTrails
  class Client
    attr_reader :api_key

    HOST = "api.securitytrails.com"
    VERSION = 1
    URL = "https://#{HOST}/v#{VERSION}"
    API_KEY_HEADER = "apikey"

    def initialize(api_key)
      @api_key = api_key
    end

    private

    def url_for(path)
      URI(URL + path)
    end

    def https_options
      if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
        uri = URI(proxy)
        {
          proxy_address: uri.hostname,
          proxy_port: uri.port,
          proxy_from_env: false,
          use_ssl: true
        }
      else
        { use_ssl: true }
      end
    end

    def request(req)
      Net::HTTP.start(HOST, 443, https_options) do |http|
        response = http.request(req)
        raise(Error, "unsupported response code returned: #{response.code}") unless response.code == "200"

        if response["Content-Type"].to_s.include? "application/json"
          yield JSON.parse(response.body, object_class: Response)
        else
          yield response.body
        end
      end
    end

    def get(path, params = {}, &block)
      url = url_for(path)
      url.query = URI.encode_www_form(params)

      get = Net::HTTP::Get.new(url)
      get.add_field(API_KEY_HEADER, api_key)
      request(get, &block)
    end

    def post(path, params = {}, &block)
      url = url_for(path)

      post = Net::HTTP::Post.new(url)
      post.body = params.is_a?(Hash) ? params.to_json : params.to_s
      post.add_field(API_KEY_HEADER, api_key)
      request(post, &block)
    end
  end
end
