# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::IPs, :vcr do
  subject { SecurityTrails::API.new }

  describe "#explore" do
    it "returns a valid JSON" do
      res = subject.ips.explore("8.8.8.8")
      expect(res.blocks).to be_an(Array)
    end
  end

  describe "#search" do
    it "returns a valid JSON" do
      res = subject.ips.search("ptr_part = 'ns1'")
      expect(res.records).to be_an(Array)
    end
  end

  describe "#stats" do
    it "returns a valid JSON" do
      res = subject.ips.stats("ptr_part = 'amazon.com'")
      expect(res.top_ptr_patterns).to be_an(Array)
      frist_pattern = res.top_ptr_patterns.first
      expect(frist_pattern.key).to be_a(String)
      expect(frist_pattern.count).to be_a(Integer)
    end
  end
end
