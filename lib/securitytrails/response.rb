# frozen_string_literal: true

require "ostruct"

module SecurityTrails
  class Response < OpenStruct
    def openstruct_to_hash(object, hash = {})
      return object unless object.respond_to?(:each_pair)

      object.each_pair do |key, value|
        hash[key] = case value
                    when OpenStruct then openstruct_to_hash(value)
                    when Array then value.map { |v| openstruct_to_hash(v) }
                    else value
                    end
      end
      hash
    end

    def to_h
      openstruct_to_hash(self)
    end
  end
end
