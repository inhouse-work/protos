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
end
