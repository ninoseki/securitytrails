# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::History, :vcr do
  subject { SecurityTrails::API.new }

  describe "#get_dns_history" do
    it "should return a valid JSON" do
      json = subject.history.get_dns_history("github.com", "a")
      expect(json["records"]).to be_an(Array)
    end
    context "when given an invalid type" do
      it "should raise an ArgumentError" do
        expect { subject.history.get_dns_history("github.com", "invalid") }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#get_all_dns_history" do
    it "should return a valid JSON" do
      json = subject.history.get_all_dns_history("github.com", "a")
      records = json["records"]
      expect(records).to be_an(Array)
      expect(records.length).to eq(records.uniq.length)
    end
  end

  describe "#get_whois_history" do
    it "should return a valid JSON" do
      json = subject.history.get_whois_history("github.com")
      expect(json["result"]["items"]).to be_an(Array)
    end
  end
end
