# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::General, :vcr do
  let(:api) { SecurityTrails::API.new }

  describe "#ping" do
    it do
      res = api.ping
      expect(res).to be_a(Hash)
    end
  end

  describe "#usage" do
    it do
      res = api.usage
      expect(res).to be_a(Hash)
    end
  end
end
