# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::IPs, :vcr do
  let(:api) { SecurityTrails::API.new }

  describe "#explore" do
    it "returns a valid JSON" do
      res = api.ips.explore("8.8.8.8")
      expect(res).to be_a(Hash)
    end
  end

  describe "#search" do
    it "returns a valid JSON" do
      res = api.ips.search("ptr_part = 'ns1'")
      expect(res).to be_a(Hash)
    end
  end

  describe "#stats" do
    it do
      res = api.ips.stats("ptr_part = 'amazon.com'")
      expect(res).to be_a(Hash)
    end
  end

  describe "#useragents" do
    it do
      # res = subject.ips.get_useragents("192.0.2.1")
      # expect(res).to be_an(Array)
    end
  end
end
