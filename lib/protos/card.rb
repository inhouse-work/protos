# frozen_string_literal: true

module Protos
  class Card < Component
    # DOCS: A card component
    # https://daisyui.com/components/card/

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

    option :size, type: Sizes, default: -> { :default }, reader: :private
    option :image_side,
      type: Types::Bool,
      default: -> { false },
      reader: :private
    option :image_full,
      type: Types::Bool,
      default: -> { false },
      reader: :private
    option :border, type: Types::Bool, default: -> { true }, reader: :private
    option :dashed, type: Types::Bool, default: -> { false }, reader: :private

    def view_template(&)
      article(**attrs, &)
    end

    def body(...) = render Body.new(...)

    def image(...) = render Image.new(...)

    def title(...) = render Title.new(...)

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
