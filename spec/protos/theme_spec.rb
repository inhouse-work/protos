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

  describe "#key?" do
    it "returns true if the key exists" do
      subject.set(:foo, "bar")

      expect(subject.key?(:foo)).to be(true)
    end

    it "returns false if the key does not exist" do
      subject.set(:foo, "bar")
      subject.remove(:foo, "bar")

      expect(subject.key?(:foo)).to be(false)
    end
  end

  describe "#add" do
    it "adds a class to the theme" do
      subject.add(:foo, "foo")

      expect(subject[:foo]).to eq("foo")
    end

    it "appends to existing classes" do
      theme = described_class.new(foo: "bar")
      theme.add(:foo, "baz")

      expect(theme[:foo]).to eq("bar baz")
    end

    it "does not append duplicates" do
      theme = described_class.new(foo: "bar")
      theme.add(:foo, "bar")

      expect(theme[:foo]).to eq("bar")
    end

    it "splits classes" do
      subject.add(:foo, "foo bar")
      subject.add(:foo, "foo")

      expect(subject[:foo]).to eq("foo bar")
    end

    it "handles nil values" do
      subject.add(:foo, nil)

      expect(subject[:foo]).to be(nil)
    end
  end

  describe "#remove" do
    it "removes a class from the theme" do
      theme = described_class.new(foo: "bar")
      theme.remove(:foo, "bar")

      expect(theme[:foo]).to be(nil)
    end

    it "handles removing a non existing key" do
      subject.remove(:foo, "bar")

      expect(subject[:foo]).to be(nil)
    end
  end

  describe "#set" do
    it "sets the value for the given key" do
      subject.set(:foo, "bar")
      subject.set(:foo, "baz")

      expect(subject[:foo]).to eq("baz")
    end

    it "handles nil values" do
      subject.set(:foo, nil)

      expect(subject[:foo]).to be_nil
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

    it "handles multiple classes on a key" do
      subject
        .merge(foo: "bar baz")
        .merge(foo: "bar")

      expect(subject[:foo]).to eq("bar baz")
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

    it "removes classes from the container key" do
      theme = described_class.new(container: "foo bar")
      negation = { "!container": "foo" }
      theme.merge(negation)

      expect(theme[:container]).to eq("bar")
    end
  end
end
