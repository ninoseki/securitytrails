# frozen_string_literal: true

require "zlib"

module SecurityTrails
  class Utility
    def self.ungzip(text)
      sio = StringIO.new(text)
      gz = Zlib::GzipReader.new(sio)
      gz.read
    end
  end
end
