RSpec.describe Protos::TokenList do
  describe "#to_s" do
    it "merges the list with tailwindcss merge" do
      tokens = described_class.new(%w[p-2 p-4]).to_s

      expect(tokens).to eq("p-4")
    end

    it "merges in semantic spacing" do
      skip("Not currently working in the gem.")
      tokens = described_class.new(%w[p-2 p-sm]).to_s

      expect(tokens).to eq("p-sm")
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
