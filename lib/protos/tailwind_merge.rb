# frozen_string_literal: true

module Protos
  class TailwindMerge
    DAISY_CLASS_GROUPS = {
      alert: [
        alert: Protos::Alert::Styles.values.map(&:to_s)
      ],
      mask: [
        mask: Protos::Avatar::MaskShapes.values.map(&:to_s)
      ],
      avatar: [
        avatar: Protos::Avatar::Indicators.values.map(&:to_s)
      ],
      badge: [
        badge: Protos::Badge::Badges.values.map(&:to_s)
      ],
      card: [
        card: Protos::Card::Sizes.values.map(&:to_s)
      ],
      carousel: [
        carousel: Protos::Carousel::Positions.values.map(&:to_s)
      ],
      "chat-bubble": [
        { "chat-bubble": Protos::ChatBubble::Positions.values.map(&:to_s) },
        {
          "chat-bubble": Protos::ChatBubble::Content::Styles.values.map(&:to_s)
        }
      ],
      menu: [
        menu: Protos::Menu::Sizes.values.map(&:to_s)
      ],
      table: [
        table: Protos::Table::Sizes.values.map(&:to_s)
      ],
      tab: [
        tab: Protos::Tabs::Sizes.values.map(&:to_s)
      ],
      caption: [
        caption: Protos::Table::Caption::Sides.values.map(&:to_s)
      ],
      swap: [
        swap: %w[on off]
      ],
      step: [
        step: Protos::Steps::Step::Styles.values.map(&:to_s)
      ]
    }.freeze

    def initialize
      @merger = ::TailwindMerge::Merger.new(
        config: {
          ignore_empty_cache: true,
          cache_size: 500,
          class_groups:
        }
      )
    end

    def merge(...)
      @merger.merge(...)
    end

    private

    def class_groups
      ::TailwindMerge::Config::DEFAULTS[:class_groups]
        .merge(DAISY_CLASS_GROUPS)
    end
  end
end
