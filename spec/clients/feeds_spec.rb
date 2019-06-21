# frozen_string_literal: true

RSpec.describe SecurityTrails::Clients::Feeds, :vcr do
  subject { SecurityTrails::API.new }

  describe "#domains" do
    it do
      res = subject.feeds.domains("new")
      expect(res).to be_an(Array)
    end

    it do
      res = subject.feeds.domains("new", tld: "jp")
      expect(res.all? { |domain| domain.end_with?("jp") }).to be(true)
    end
  end
end
