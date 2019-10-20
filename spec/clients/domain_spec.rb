# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::Domain, :vcr do
  let(:api) { SecurityTrails::API.new }

  describe "#get_by_hostname" do
    it do
      res = api.domain.get_by_hostname("github.com");
      expect(res).to be_a(Hash)
    end
  end

  describe "#get_subdomains" do
    it do
      res = api.domain.get_subdomains("github.com");
      expect(res).to be_a(Hash)
    end
  end

  describe "#get_tags" do
    it do
      res = api.domain.get_tags("github.com")
      expect(res).to be_a(Hash)
    end
  end

  describe "#get_associated_domains" do
    it do
      res = api.domain.get_associated_domains("github.com")
      expect(res).to be_a(Hash)
    end
  end

  describe "#get_whois" do
    it do
      res = api.domain.get_whois("github.com")
      expect(res).to be_a(Hash)
    end
  end
end
