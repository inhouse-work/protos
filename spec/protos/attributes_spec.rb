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

    it "handles non-existent attributes" do
      expect(subject[:foo]).to be_nil
    end
  end

  describe "#merge" do
    it "merges multiple hashes in order" do
      attrs = described_class.new(foo: "bar")
      attrs.merge({ foo: "baz" }, { bar: "qux" }, nil)

      expect(attrs[:foo]).to eq("baz")
      expect(attrs[:bar]).to eq("qux")
    end

    it "merges class and data values" do
      attrs = described_class.new(class: "bar", data: { controller: "one" })
      attrs.merge({ class: "baz" }, data: { controller: "two" })

      expect(attrs[:class]).to eq("bar baz")
      expect(attrs[:data]).to eq(controller: "one two")
    end
  end
end
