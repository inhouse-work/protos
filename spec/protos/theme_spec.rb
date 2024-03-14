# frozen_string_literal: true

RSpec.describe Protos::Theme do
  describe "initialization" do
    it "initializes with a hash or keywords" do
      expect { described_class.new({ foo: "bar" }) }
        .not_to raise_error
      expect { described_class.new(foo: "bar") }
        .not_to raise_error
    end
  end

  describe "#[]" do
    it "returns the value for the given key" do
      theme = described_class.new(foo: "bar")
      expect(theme[:foo]).to eq("bar")
    end

    it "merges styles using tailwindcss merger" do
      theme = described_class.new(foo: "p-2 p-4")

      expect(theme[:foo]).to eq("p-4")
    end
  end

  describe "#merge" do
    it "handles a nil value" do
      theme = described_class.new(foo: "bar")
      theme.merge(nil)

      expect(theme[:foo]).to eq("bar")
    end

    it "adds new keys to the theme" do
      theme = described_class.new
      theme.merge(foo: "bar")

      expect(theme[:foo]).to eq("bar")
    end

    it "returns a new theme with the given hash deeply merged in" do
      theme = described_class.new(foo: "bar")
      theme.merge(foo: "baz")

      expect(theme[:foo]).to eq("bar baz")
    end

    it "overwrites keys with a bang" do
      theme = described_class.new(foo: "bar")
      override = { foo!: "baz" }
      theme.merge(override)

      expect(theme[:foo]).to eq("baz")
    end

    it "removes classes prefixed with a bang" do
      theme = described_class.new(foo: "bar baz")
      negation = { "!foo": "bar" }
      theme.merge(negation)

      expect(theme[:foo]).to eq("baz")
    end
  end
end
