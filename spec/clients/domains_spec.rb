# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::Domains, :vcr do
  let(:api) { SecurityTrails::API.new }

  describe "#search" do
    it do
      res = api.domains.search(filter: { ipv4: "1.1.1.1" })
      expect(res).to be_a(Hash)
    end
  end

  describe "#stats" do
    it do
      res = api.domains.stats(filter: { ipv4: "1.1.1.1" })
      expect(res).to be_a(Hash)
    end
  end
end
