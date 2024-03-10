# frozen_string_literal: true

module Protos
  class Carousel < Component
    # DOCS: A carousel component that contains items that can be scrolled
    # through in a mobile friendly manner.
    # https://daisyui.com/components/carousel/

    option :vertical, type: Types::Bool, default: -> { false }
    option :snap_to,
           default: -> { :none },
           reader: false,
           type: Types::Coercible::Symbol.enum(
             :none,
             :center,
             :end
           )

    def template(&block)
      div(**attrs, &block)
    end

    def item(...)
      Item.new(...)
    end

    def actions(...)
      Actions.new(...)
    end

    private

    def snap_to
      {
        none: "",
        center: "carousel-center",
        end: "carousel-end"
      }.fetch(@snap_to)
    end

    def theme
      {
        container: tokens(
          "carousel",
          snap_to,
          vertical: "carousel-vertical"
        )
      }
    end
  end
end
