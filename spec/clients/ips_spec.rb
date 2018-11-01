# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::IPs, :vcr do
  subject { SecurityTrails::API.new }

  describe "#explore" do
    it "should return a valid JSON" do
      json = subject.ips.explore("8.8.8.8")
      expect(json["blocks"]).to be_an(Array)
    end
  end

  describe "#search" do
    it "should return a valid JSON" do
      json = subject.ips.search("ptr_part = 'ns1'")
      expect(json["records"]).to be_an(Array)
    end
  end

  describe "#stats" do
    it "should return a valid JSON" do
      json = subject.ips.stats("ptr_part = 'amazon.com'")
      expect(json["top_ptr_patterns"]).to be_an(Array)
    end
  end
end
