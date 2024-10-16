# frozen_string_literal: true

module Protos
  class Carousel < Component
    # DOCS: A carousel component that contains items that can be scrolled
    # through in a mobile friendly manner.
    # https://daisyui.com/components/carousel/

    autoload :Item, "protos/carousel/item"
    autoload :Actions, "protos/carousel/actions"

    SNAP_POINTS = {
      none: "",
      center: "carousel-center",
      end: "carousel-end"
    }.freeze

    option :vertical, type: Types::Bool, default: -> { false }
    option :snap_to,
      default: -> { :none },
      reader: false,
      type: Types::Coercible::Symbol.enum(
        :none,
        :center,
        :end
      )

    def view_template(&)
      div(**attrs, &)
    end

    def item(...) = render Item.new(...)

    def actions(...) = render Actions.new(...)

    private

    def snap_to
      SNAP_POINTS.fetch(@snap_to)
    end

    def theme
      {
        container: [
          "carousel",
          snap_to,
          ("carousel-vertical" if vertical)
        ]
      }
    end
  end
end
