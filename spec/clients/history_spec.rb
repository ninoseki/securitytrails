# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::History, :vcr do
  subject { SecurityTrails::API.new }

  describe "#get_dns_history" do
    it "should return a valid JSON" do
      res = subject.history.get_dns_history("github.com", "a")
      expect(res.records).to be_an(Array)
      first = res.records.first
      expect(first.values.first.ip).to be_a(String)
    end
    context "when given an invalid type" do
      it "should raise an ArgumentError" do
        expect { subject.history.get_dns_history("github.com", "invalid") }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#get_all_dns_history" do
    it "should return a valid JSON" do
      res = subject.history.get_all_dns_history("github.com", "a")
      records = res.records
      expect(records).to be_an(Array)
      expect(records.length).to eq(records.uniq.length)
    end
  end

  describe "#get_whois_history" do
    it "should return a valid JSON" do
      res = subject.history.get_whois_history("github.com")
      expect(res.result.items).to be_an(Array)
    end
  end
end
