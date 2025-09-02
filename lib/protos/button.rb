# frozen_string_literal: true

module Protos
  # @see https://daisyui.com/components/button/
  #
  # @example Basic button
  #   render Protos::Button.new { "Click me" }
  #
  # @example Primary large button
  #   render Protos::Button.new(color: :primary, size: :lg) { "Submit" }
  class Button < Component
    Variants = Types::Coercible::Symbol.enum(
      :default,
      :outline,
      :ghost,
      :link,
      :soft,
      :dash
    )

    Shapes = Types::Coercible::Symbol.enum(
      :default,
      :square,
      :circle
    )

    Elements = Types::Coercible::Symbol.enum(:button, :a)

    COLORS = {
      default: "",
      primary: "btn-primary",
      secondary: "btn-secondary",
      accent: "btn-accent",
      info: "btn-info",
      success: "btn-success",
      warning: "btn-warning",
      error: "btn-error"
    }.freeze

    VARIANTS = {
      default: "",
      outline: "btn-outline",
      ghost: "btn-ghost",
      link: "btn-link",
      soft: "btn-soft",
      dash: "btn-dash"
    }.freeze

    SIZES = {
      default: "btn-md",
      xs: "btn-xs",
      sm: "btn-sm",
      md: "btn-md",
      lg: "btn-lg",
      xl: "btn-xl"
    }.freeze

    SHAPES = {
      default: "",
      square: "btn-square",
      circle: "btn-circle"
    }.freeze

    # @!attribute [r] color
    # @return [Types::Colors]
    option :color, type: Types::Colors, default: -> { :default }
    # @!attribute [r] variant
    # @return [Variants]
    option :variant, type: Variants, default: -> { :default }
    # @!attribute [r] shape
    # @return [Shapes]
    option :shape, type: Shapes, default: -> { :default }
    # @!attribute [r] size
    # @return [Types::Sizes]
    option :size, type: Types::Sizes, default: -> { :default }
    # @!attribute [r] wide
    # @return [Boolean] Whether the button should take full width.
    option :wide, type: Types::Bool, default: -> { false }
    # @!attribute [r] block
    # @return [Boolean] Whether the button should be displayed as a
    #   block element.
    option :block, type: Types::Bool, default: -> { false }
    # @!attribute [r] active
    # @return [Boolean] Whether the button is in an active state.
    option :active, type: Types::Bool, default: -> { false }
    # @!attribute [r] disabled
    # @return [Boolean] Whether the button is disabled.
    option :disabled, type: Types::Bool, default: -> { false }
    # @!attribute [r] element
    # @return [Elements] The HTML element to use for the button.
    option :element, type: Elements, default: -> { :button }

    def view_template(&)
      send(element, **attrs, &)
    end

    private

    def block? = @block
    def wide? = @wide
    def active? = @active
    def disabled? = @disabled

    def theme
      {
        container: [
          "btn",
          COLORS.fetch(color),
          VARIANTS.fetch(variant),
          SIZES.fetch(size),
          SHAPES.fetch(shape),
          ("btn-block" if block?),
          ("btn-wide" if wide?),
          ("btn-active" if active?),
          ("btn-disabled" if disabled?)
        ]
      }
    end
  end
end
