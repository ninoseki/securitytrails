# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::History, :vcr do
  let(:api) { SecurityTrails::API.new }

  describe "#get_dns_history" do
    it do
      res = api.history.get_dns_history("github.com", "a")
      expect(res).to be_a(Hash)
    end

    context "when given an invalid type" do
      it do
        expect { api.history.get_dns_history("github.com", "invalid") }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#get_all_dns_history" do
    it do
      res = api.history.get_all_dns_history("github.com", "a")
      expect(res).to be_a(Hash)
    end
  end

  describe "#get_whois_history" do
    it do
      res = api.history.get_whois_history("github.com")
      expect(res).to be_a(Hash)
    end
  end
end
