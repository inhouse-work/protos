# frozen_string_literal: true

module Protos
  class Avatar < Component
    IndicatorTypes = Types::Coercible::Symbol.enum(:none, :online, :offline)

    option :placeholder, type: Types::Bool, default: -> { false }
    option :indicator,
           type: IndicatorTypes,
           default: -> { :none },
           reader: false
    option :shape,
           type: Types::MaskShapes,
           default: -> { :none },
           reader: false

    def template(&block)
      div(**attrs) do
        div(class: css[:figure], &block)
      end
    end

    private

    def indicator
      {
        none: "",
        online: "online",
        offline: "offline"
      }.fetch(@indicator)
    end

    def shape
      {
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
        parallelogram: "mask mask-parallelogram",
        parallelogram2: "mask mask-parallelogram-2",
        parallelogram3: "mask mask-parallelogram-3",
        parallelogram4: "mask mask-parallelogram-4",
        star: "mask mask-star",
        star2: "mask mask-star-2",
        triangle: "mask mask-triangle",
        triangle2: "mask mask-triangle-2",
        triangle3: "mask mask-triangle-3",
        triangle4: "mask mask-triangle-4",
        half1: "mask mask-half-1",
        half2: "mask mask-half-2"
      }.fetch(@shape)
    end

    def css
      @css ||= build_theme(
        container: tokens(
          "avatar",
          indicator,
          placeholder: "placeholder"
        ),
        figure: tokens(shape)
      )
    end
  end
end
