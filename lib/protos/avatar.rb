# frozen_string_literal: true

module Protos
  class Avatar < Component
    # DOCS: The avatar component is used to represent a user or entity.
    # https://daisyui.com/components/avatar/

    Indicators = Types::Coercible::Symbol.enum(:none, :online, :offline)
    MaskShapes = Types::Coercible::Symbol.enum(
      :none,
      :squircle,
      :heart,
      :hexagon,
      :hexagon2,
      :decagon,
      :pentagon,
      :diamond,
      :square,
      :circle,
      :parallelogram,
      :parallelogram2,
      :parallelogram3,
      :parallelogram4,
      :star,
      :star2,
      :triangle,
      :triangle2,
      :triangle3,
      :triangle4,
      :half1,
      :half2
    )

    SHAPES = {
      none: "",
      squircle: "mask mask-squircle",
      heart: "mask mask-heart",
      hexagon: "mask mask-hexagon",
      hexagon2: "mask mask-hexagon-2",
      decagon: "mask mask-decagon",
      pentagon: "mask mask-pentagon",
      diamond: "mask mask-diamond",
      square: "mask mask-square",
      circle: "mask mask-circle",
      star: "mask mask-star",
      star2: "mask mask-star-2",
      triangle: "mask mask-triangle",
      triangle2: "mask mask-triangle-2",
      triangle3: "mask mask-triangle-3",
      triangle4: "mask mask-triangle-4",
      half1: "mask mask-half-1",
      half2: "mask mask-half-2"
    }.freeze

    INDICATORS = {
      none: "",
      online: "avatar-online",
      offline: "avatar-offline"
    }.freeze

    option :placeholder, type: Types::Bool, default: -> { false }
    option :indicator,
      type: Indicators,
      default: -> { :none },
      reader: false
    option :shape,
      type: MaskShapes,
      default: -> { :none },
      reader: false

    def view_template(&block)
      div(**attrs) do
        div(class: css[:figure], &block)
      end
    end

    private

    def indicator
      INDICATORS.fetch(@indicator)
    end

    def shape
      SHAPES.fetch(@shape)
    end

    def theme
      {
        container: [
          "avatar",
          indicator,
          ("placeholder" if placeholder)
        ],
        figure: shape
      }
    end
  end
end
