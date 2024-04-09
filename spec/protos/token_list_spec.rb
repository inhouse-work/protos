# frozen_string_literal: true

RSpec.describe Protos::TokenList do
  describe ".parse" do
    it "allows nil" do
      tokens = described_class.parse(nil).to_s

      expect(tokens).to eq("")
    end
  end

  describe "#add" do
    it "adds the given token to the list" do
      subject.add("baz")
      tokens = subject.to_s

      expect(tokens).to eq("baz")
    end
  end

  describe "#remove" do
    it "removes the given token from the list" do
      tokens = described_class.new(%w[foo bar])
      tokens.remove("bar")

      expect(tokens.to_s).to eq("foo")
    end
  end
end
