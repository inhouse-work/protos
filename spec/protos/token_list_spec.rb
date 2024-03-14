RSpec.describe Protos::TokenList do
  describe ".parse" do
    it "allows nil" do
      tokens = described_class.parse(nil).to_s

      expect(tokens).to eq("")
    end
  end

  describe "#add" do
    it "adds the given token to the list" do
      tokens = described_class
        .new
        .add("baz")
        .to_s

      expect(tokens).to eq("baz")
    end
  end

  describe "#remove" do
    it "removes the given token from the list" do
      tokens = described_class
        .new(%w[foo bar])
        .remove("bar")
        .to_s

      expect(tokens).to eq("foo")
    end
  end

  describe "#-" do
    it "returns a new list with the given tokens removed" do
      tokens_a = described_class.new(%w[foo bar])
      tokens_b = described_class.new(["bar"])
      tokens = (tokens_a - tokens_b).to_s

      expect(tokens).to eq("foo")
    end
  end

  describe "#+" do
    it "returns a new list with the given tokens added" do
      tokens_a = described_class.new(%w[foo bar])
      tokens_b = described_class.new(["baz"])
      tokens = (tokens_a + tokens_b).to_s

      expect(tokens).to eq("foo bar baz")
    end
  end
end
