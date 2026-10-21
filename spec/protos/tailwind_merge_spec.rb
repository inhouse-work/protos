# frozen_string_literal: true

RSpec.describe Protos::TailwindMerge do
  describe ".cache_size" do
    around do |example|
      original = described_class.cache_size
      example.run
    ensure
      described_class.cache_size = original
    end

    it "defaults to 1_000" do
      expect(described_class.cache_size).to eq(1_000)
    end

    it "can be configured" do
      described_class.cache_size = 2_000

      expect(described_class.cache_size).to eq(2_000)
    end
  end

  describe "#merge" do
    it "merges with daisyui context" do
      merged = subject.merge(%w[card-sm card-md])

      expect(merged).to eq("card-md")
    end

    it "merges alert colors" do
      merged = subject.merge(%w[alert alert-soft alert-info alert-success])

      expect(merged).to eq("alert alert-soft alert-success")
    end

    it "merges alert variants" do
      merged = subject.merge(%w[alert alert-info alert-outline alert-soft])

      expect(merged).to eq("alert alert-info alert-soft")
    end
  end
end
