# frozen_string_literal: true

module Protos
  class Card < Component
    # DOCS: A card component
    # https://daisyui.com/components/card/

    ImageDisplayTypes = Types::Coercible::Symbol.enum(:default, :overlay, :side)

    option :border, type: Types::Bool, default: -> { true }, reader: :private
    option :compact, type: Types::Bool, default: -> { false }, reader: :private
    option :image_display,
           ImageDisplayTypes,
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
      {
        default: "",
        overlay: "image-full",
        side: "card-side"
      }.fetch(@image_display)
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
