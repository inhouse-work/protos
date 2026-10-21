# frozen_string_literal: true

module Protos
  class TailwindMerge
    DEFAULTS = ::TailwindMerge::Config::DEFAULTS

    # Override before the first render when a different size is needed:
    #
    # @example
    #   Protos::TailwindMerge.cache_size = 2_000
    DEFAULT_CACHE_SIZE = 1_000

    class << self
      attr_writer :cache_size

      # @return [Integer]
      def cache_size = @cache_size || DEFAULT_CACHE_SIZE
    end

    # WARNING: These lists are intentionally hard-coded instead of derived from
    # the component enums. Referencing `Protos::Alert::Colors` and friends here
    # forces every component constant to autoload when the merger is built,
    # which adds boot time and memory even for apps that never render them.
    #
    # Keep them in sync with the component enums. The accompanying spec in
    # `spec/protos/tailwind_merge_spec.rb` asserts that both sides match.
    DAISY_CLASS_GROUPS = {
      alert_colors: [
        { alert: %w[default info success warning error] }
      ],
      alert_variants: [
        { alert: %w[default outline dash soft] }
      ],
      mask_shapes: [
        {
          mask: %w[
            none
            squircle
            heart
            hexagon
            hexagon2
            decagon
            pentagon
            diamond
            square
            circle
            star
            star2
            triangle
            triangle2
            triangle3
            triangle4
            half1
            half2
          ]
        }
      ],
      avatar_indicators: [
        { avatar: %w[none online offline] }
      ],
      badge_styles: [
        {
          badge: %w[
            default
            primary
            secondary
            accent
            info
            success
            warning
            error
            ghost
          ]
        }
      ],
      card_sizes: [
        { card: %w[default xs sm md lg xl] }
      ],
      carousel_positions: [
        { carousel: %w[none center end] }
      ],
      chat_bubble_positions: [
        { "chat-bubble": %w[start end] }
      ],
      chat_bubble_styles: [
        {
          "chat-bubble": %w[
            default
            primary
            secondary
            accent
            info
            success
            warning
            error
          ]
        }
      ],
      menu: [
        { menu: %w[xs sm md lg xl] }
      ],
      table: [
        { table: %w[xs sm md lg] }
      ],
      tab: [
        { tab: %w[xs sm md lg] }
      ],
      caption: [
        { caption: %w[bottom top] }
      ],
      swap: [
        { swap: %w[on off] }
      ],
      step: [
        {
          step: %w[
            default
            primary
            secondary
            accent
            info
            success
            warning
            error
          ]
        }
      ]
    }.freeze

    # @param cache_size [Integer]
    def initialize(cache_size: self.class.cache_size)
      @merger = ::TailwindMerge::Merger.new(
        config: DEFAULTS.merge(
          ignore_empty_cache: true,
          cache_size: cache_size,
          class_groups: DEFAULTS[:class_groups].merge(DAISY_CLASS_GROUPS)
        )
      )
    end

    def merge(...)
      @merger.merge(...)
    end
  end
end
