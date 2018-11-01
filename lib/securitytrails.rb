# frozen_string_literal: true

require "securitytrails/version"

require "securitytrails/api"
require "securitytrails/response"
require "securitytrails/client"

require "securitytrails/clients/domain"
require "securitytrails/clients/domains"
require "securitytrails/clients/history"
require "securitytrails/clients/ips"

module SecurityTrails
  class Error < StandardError; end
end
