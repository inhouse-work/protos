# frozen_string_literal: true

RSpec.describe Protos::Attributes do
  describe "#initialize" do
    it "accepts a hash of attributes or keywords" do
      expect { described_class.new({ foo: "bar" }) }
        .not_to raise_error
      expect { described_class.new(foo: "bar") }
        .not_to raise_error
    end
  end

  describe "#[]" do
    it "returns the value of the attribute" do
      attrs = described_class.new(foo: "bar")
      expect(attrs[:foo]).to eq("bar")
    end
  end

  describe "#merge" do
    it "handles a nil value" do
      attrs = described_class.new(foo: "bar")
      attrs.merge(nil)

      expect(attrs[:foo]).to eq("bar")
    end

    it "merges the attributes" do
      attrs = described_class.new(string: "bar", array: [1, 2], hash: { a: 1 })
      attrs.merge(string: "baz", array: [3], hash: { a: 2, b: 3 })

      expect(attrs[:string]).to eq("bar baz")
      expect(attrs[:array]).to eq([1, 2, 3])
      expect(attrs[:hash]).to eq(a: 2, b: 3)
    end
  end
end
