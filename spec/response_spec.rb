# frozen_string_literal: true

RSpec.describe SecurityTrails::Response do
  describe "#to_h" do
    it "shoud return a genuine Hash" do
      hash = { first: { second: { third: 1 } } }
      json = hash.to_json
      res = JSON.parse(json, object_class: SecurityTrails::Response)

      expect(res.first.second.third).to eq(1)
      h = res.to_h
      expect(h).to be_a(Hash)
      expect(h[:first][:second]).to be_a(Hash)
      expect(h[:first][:second][:third]).to eq(1)
    end
  end
end
