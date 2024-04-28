# frozen_string_literal: true

module Protos
  class Card < Component
    # DOCS: A card component
    # https://daisyui.com/components/card/

    ImageDisplays = Types::Coercible::Symbol.enum(:default, :overlay, :side)

    IMAGE_DISPLAYS = {
      default: "",
      overlay: "image-full",
      side: "card-side"
    }.freeze

    option :border, type: Types::Bool, default: -> { true }, reader: :private
    option :compact, type: Types::Bool, default: -> { false }, reader: :private
    option :image_display,
           ImageDisplays,
           default: -> { :default },
           reader: false

    def view_template(&)
      article(**attrs, &)
    end

    def body(...) = render Body.new(...)

    def image(...) = render Image.new(...)

    def title(...) = render Title.new(...)

    def actions(...) = render Actions.new(...)

    private

    def image_display
      IMAGE_DISPLAYS.fetch(@image_display)
    end

    def theme
      {
        container: tokens(
          "card",
          image_display,
          border: "card-bordered",
          compact: "card-compact"
        )
      }
    end
  end
end
