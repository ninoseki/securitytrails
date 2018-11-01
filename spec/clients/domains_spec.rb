# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::Domains, :vcr do
  subject { SecurityTrails::API.new }

  describe "#search" do
    it "should return a valid JSON" do
      json = subject.domains.search(
        filter: {
          ipv4: "1.1.1.1"
        }
      )
      expect(json["records"]).to be_an(Array)
    end
  end

  describe "#stats" do
    it "should return a valid JSON" do
      json = subject.domains.stats(
        filter: {
          ipv4: "1.1.1.1"
        }
      )
      expect(json["tld_count"]).to be_an(Integer)
    end
  end
end
