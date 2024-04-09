# frozen_string_literal: true

RSpec.describe Protos::TokenList do
  describe "#clear" do
    it "clears the list" do
      subject.add("foo")
      subject.clear

      expect(subject.to_s).to eq("")
    end
  end

  describe "#add" do
    it "adds the given token to the list" do
      subject.add("baz")

      expect(subject.to_s).to eq("baz")
    end

    it "splits classes" do
      subject.add("foo bar")
      subject.add("foo")

      expect(subject.to_s).to eq("foo bar")
    end

    it "does not add duplicates" do
      subject.add("baz")

      expect { subject.add("baz") }
        .not_to change(subject, :to_s)
    end

    it "handles spacing issues" do
      subject.add("foo  bar")
      subject.add("  foo")
      subject.add("foo")

      expect(subject.to_s).to eq("foo bar")
    end
  end

  describe "#remove" do
    it "removes the given token from the list" do
      tokens = described_class.new(%w[foo bar])
      tokens.remove("bar")

      expect(tokens.to_s).to eq("foo")
    end

    it "handles removing a non existing key" do
      subject.remove("bar")

      expect(subject.to_s).to eq("")
    end
  end
end
