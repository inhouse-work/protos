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

  describe "DAISY_CLASS_GROUPS" do
    # These are hard-coded in the library so that building the merger does not
    # autoload every component. This spec keeps them in sync with the enums.
    it "matches the component enums" do
      groups = described_class::DAISY_CLASS_GROUPS

      expect(groups[:alert_colors]).to eq(
        [{ alert: Protos::Alert::Colors.values.map(&:to_s) }]
      )
      expect(groups[:alert_variants]).to eq(
        [{ alert: Protos::Alert::Variants.values.map(&:to_s) }]
      )
      expect(groups[:mask_shapes]).to eq(
        [{ mask: Protos::Avatar::MaskShapes.values.map(&:to_s) }]
      )
      expect(groups[:avatar_indicators]).to eq(
        [{ avatar: Protos::Avatar::Indicators.values.map(&:to_s) }]
      )
      expect(groups[:badge_styles]).to eq(
        [{ badge: Protos::Badge::Styles.values.map(&:to_s) }]
      )
      expect(groups[:card_sizes]).to eq(
        [{ card: Protos::Types::Sizes.values.map(&:to_s) }]
      )
      expect(groups[:carousel_positions]).to eq(
        [{ carousel: Protos::Carousel::Positions.values.map(&:to_s) }]
      )
      expect(groups[:chat_bubble_positions]).to eq(
        [{ "chat-bubble": Protos::ChatBubble::Positions.values.map(&:to_s) }]
      )
      expect(groups[:chat_bubble_styles]).to eq(
        [{ "chat-bubble": Protos::Types::Colors.values.map(&:to_s) }]
      )
      expect(groups[:menu]).to eq(
        [{ menu: Protos::Menu::Sizes.values.map(&:to_s) }]
      )
      expect(groups[:table]).to eq(
        [{ table: Protos::Table::Sizes.values.map(&:to_s) }]
      )
      expect(groups[:tab]).to eq(
        [{ tab: Protos::Tabs::Sizes.values.map(&:to_s) }]
      )
      expect(groups[:caption]).to eq(
        [{ caption: Protos::Table::Caption::Sides.values.map(&:to_s) }]
      )
      expect(groups[:swap]).to eq([{ swap: %w[on off] }])
      expect(groups[:step]).to eq(
        [{ step: Protos::Types::Colors.values.map(&:to_s) }]
      )
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
