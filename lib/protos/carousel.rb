# frozen_string_literal: true

module Protos
  # A carousel component that contains items that can be scrolled
  # through in a mobile friendly manner.
  #
  # @see https://daisyui.com/components/carousel/
  #
  # @example Basic horizontal carousel
  #   Protos::Carousel.new(snap_to: :center) do |carousel|
  #     carousel.item { img(src: "image1.jpg", alt: "Image 1") }
  #     carousel.item { img(src: "image2.jpg", alt: "Image 2") }
  #     carousel.item { img(src: "image3.jpg", alt: "Image 3") }
  #   end
  #
  # @example Vertical carousel with actions
  #   Protos::Carousel.new(vertical: true, snap_to: :center) do |carousel|
  #     carousel.item { div(class: "h-64 bg-primary") { "Slide 1" } }
  #     carousel.item { div(class: "h-64 bg-secondary") { "Slide 2" } }
  #     carousel.item { div(class: "h-64 bg-accent") { "Slide 3" } }
  #     carousel.actions do
  #       button(class: "btn btn-circle") { "❮" }
  #       button(class: "btn btn-circle") { "❯" }
  #     end
  #   end
  class Carousel < Component

    autoload :Item, "protos/carousel/item"
    autoload :Actions, "protos/carousel/actions"

    Positions = Types::Coercible::Symbol.enum(
      :none,
      :center,
      :end
    )

    SNAP_POINTS = {
      none: "",
      center: "carousel-center",
      end: "carousel-end"
    }.freeze

    # @!attribute [r] vertical
    #   @return [Boolean] Whether to display carousel vertically instead of horizontally.
    option :vertical, type: Types::Bool, default: -> { false }

    # @!attribute [r] snap_to
    #   @return [Symbol] One of `:none`, `:center`, or `:end` for snap positioning.
    option :snap_to,
      default: -> { :none },
      reader: false,
      type: Positions

    # Renders the full carousel element.
    #
    # @yield The content block to define carousel items and actions.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      div(**attrs, &)
    end

    # Renders a carousel item.
    #
    # @param (see Protos::Carousel::Item#initialize)
    # @return [nil]
    def item(...) = render Item.new(...)

    # Renders carousel actions (navigation buttons, etc.).
    #
    # @param (see Protos::Carousel::Actions#initialize)
    # @return [nil]
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
