# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::Domains, :vcr do
  subject { SecurityTrails::API.new }

  describe "#search" do
    it "should return a valid JSON" do
      res = subject.domains.search(
        filter: {
          ipv4: "1.1.1.1"
        }
      )
      expect(res.records).to be_an(Array)
      expect(res.to_h).to be_a(Hash)
    end
  end

  describe "#stats" do
    it "should return a valid JSON" do
      res = subject.domains.stats(
        filter: {
          ipv4: "1.1.1.1"
        }
      )
      expect(res.tld_count).to be_an(Integer)
    end
  end
end
