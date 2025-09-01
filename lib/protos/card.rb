# frozen_string_literal: true

module Protos
  # A card component for displaying content in a contained panel
  #
  # @see https://daisyui.com/components/card/
  #
  # @example Basic card
  #   Protos::Card.new do |card|
  #     card.image { img(src: "image.jpg", alt: "Card image") }
  #     card.body do
  #       card.title { "Card Title" }
  #       p { "Card content goes here" }
  #       card.actions do
  #         button(class: "btn btn-primary") { "Action" }
  #       end
  #     end
  #   end
  #
  # @example Card with side image
  #   Protos::Card.new(image_side: true) do |card|
  #     card.image { img(src: "image.jpg", alt: "Side image", class: "w-32") }
  #     card.body do
  #       card.title { "Card with Side Image" }
  #       p { "Content appears next to the image" }
  #     end
  #   end
  class Card < Component
    autoload :Body, "protos/card/body"
    autoload :Title, "protos/card/title"
    autoload :Actions, "protos/card/actions"
    autoload :Image, "protos/card/image"

    Sizes = Types::Coercible::Symbol.enum(
      :default,
      :xs,
      :sm,
      :md,
      :lg,
      :xl
    )

    SIZES = {
      default: "card-md",
      xs: "card-xs",
      sm: "card-sm",
      md: "card-md",
      lg: "card-lg",
      xl: "card-xl"
    }.freeze

    # @!attribute [r] size
    #   @return [Symbol] One of:
    #     - `:default`
    #     - `:xs`
    #     - `:sm`
    #     - `:md`
    #     - `:lg`
    #     - `:xl`
    option :size, type: Sizes, default: -> { :default }, reader: :private

    # @!attribute [r] image_side
    #   @return [Boolean] Whether to display image on the side
    #     (horizontal layout).
    option :image_side,
      type: Types::Bool,
      default: -> { false },
      reader: :private

    # @!attribute [r] image_full
    #   @return [Boolean] Whether image should take full width/height of card.
    option :image_full,
      type: Types::Bool,
      default: -> { false },
      reader: :private

    # @!attribute [r] border
    #   @return [Boolean] Whether to show card border.
    option :border, type: Types::Bool, default: -> { true }, reader: :private

    # @!attribute [r] dashed
    #   @return [Boolean] Whether to use dashed border style.
    option :dashed, type: Types::Bool, default: -> { false }, reader: :private

    # Renders the card container element.
    #
    # @yield The content block to define card parts.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      article(**attrs, &)
    end

    # Renders the card body (main content area).
    #
    # @param (see Protos::Card::Body#initialize)
    # @return [nil]
    def body(...) = render Body.new(...)

    # Renders the card image container.
    #
    # @param (see Protos::Card::Image#initialize)
    # @return [nil]
    def image(...) = render Image.new(...)

    # Renders the card title.
    #
    # @param (see Protos::Card::Title#initialize)
    # @return [nil]
    def title(...) = render Title.new(...)

    # Renders the card actions area.
    #
    # @param (see Protos::Card::Actions#initialize)
    # @return [nil]
    def actions(...) = render Actions.new(...)

    private

    def theme
      {
        container: [
          "card",
          SIZES[size],
          ("card-border" if border),
          ("card-dash" if dashed),
          ("image-full" if image_full),
          ("card-side" if image_side)
        ]
      }
    end
  end
end
