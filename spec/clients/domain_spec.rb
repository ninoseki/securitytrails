# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::Domain, :vcr do
  subject { SecurityTrails::API.new }

  describe "#get_by_hostname" do
    it "should return a valid JSON" do
      json = subject.domain.get_by_hostname("github.com");
      expect(json["hostname"]).to eq("github.com")
    end
  end

  describe "#get_subdomains" do
    it "should return a valid JSON" do
      json = subject.domain.get_subdomains("github.com");
      expect(json["subdomains"]).to be_an(Array)
    end
  end

  describe "#get_tags" do
    it "should return a valid JSON" do
      json = subject.domain.get_tags("github.com")
      expect(json["tags"]).to be_an(Array)
    end
  end

  describe "#get_associated_domains" do
    it "should return a valid JSON" do
      json = subject.domain.get_associated_domains("github.com")
      expect(json["records"]).to be_an(Array)
    end
  end

  describe "#get_whois" do
    it "should return a valid JSON" do
      json = subject.domain.get_whois("github.com")
      expect(json["domain"]).to eq("github.com")
    end
  end
end
