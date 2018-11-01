# frozen_string_literal: true

require "json"
require "net/https"

module SecurityTrails
  class Client
    attr_reader :api_key

    HOST = "api.securitytrails.com"
    VERSION = 1
    URL = "https://#{HOST}/v#{VERSION}"

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
        if response.code == '200'
          yield JSON.parse(response.body, object_class: Response)
        else
          raise(Error, "unsupported response code returned: #{response.code}")
        end
      end
    end

    def get(path, params = {}, &block)
      url = url_for(path)
      params["apikey"] = api_key
      url.query = URI.encode_www_form(params)

      get = Net::HTTP::Get.new(url)
      request(get, &block)
    end

    def post(path, params = {}, &block)
      url = url_for(path)
      url.query = "apikey=#{api_key}"

      post = Net::HTTP::Post.new(url)
      post.body = params.is_a?(Hash) ? params.to_json : params.to_s
      request(post, &block)
    end
  end
end
