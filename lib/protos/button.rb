# frozen_string_literal: true

module Protos
  # @see https://daisyui.com/components/button/
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

    option :color, type: Types::Colors, default: -> { :default }
    option :variant, type: Variants, default: -> { :default }
    option :shape, type: Shapes, default: -> { :default }
    option :size, type: Types::Sizes, default: -> { :default }
    option :wide, type: Types::Bool, default: -> { false }
    option :block, type: Types::Bool, default: -> { false }
    option :active, type: Types::Bool, default: -> { false }
    option :disabled, type: Types::Bool, default: -> { false }

    def view_template(&)
      button(**attrs, &)
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
