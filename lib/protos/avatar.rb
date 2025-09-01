# frozen_string_literal: true

module Protos
  # An avatar component for displaying user or entity images
  #
  # @see https://daisyui.com/components/avatar/
  #
  # @example Basic avatar
  #   Protos::Avatar.new do
  #     img(src: "user.jpg", alt: "User avatar")
  #   end
  #
  # @example Avatar with indicator
  #   Protos::Avatar.new(indicator: :online) do
  #     img(src: "user.jpg", alt: "User avatar")
  #   end
  #
  # @example Avatar with shape mask
  #   Protos::Avatar.new(shape: :circle) do
  #     img(src: "user.jpg", alt: "User avatar")
  #   end
  class Avatar < Component
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

    # @!attribute [r] placeholder
    #   @return [Boolean] Whether to show placeholder styling.
    option :placeholder, type: Types::Bool, default: -> { false }

    # @!attribute [r] indicator
    #   @return [Symbol] One of:
    #     - `:none`
    #     - `:online`
    #     - `:offline`
    option :indicator,
      type: Indicators,
      default: -> { :none },
      reader: false

    # @!attribute [r] shape
    #   @return [Symbol] One of:
    #     - `:none`
    #     - `:squircle`
    #     - `:heart`
    #     - `:hexagon`
    option :shape,
      type: MaskShapes,
      default: -> { :none },
      reader: false

    # Renders the avatar container element.
    #
    # @yield The content block for the avatar image/content.
    # @return [nil] outputs to the @buffer
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
