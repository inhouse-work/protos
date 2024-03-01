# frozen_string_literal: true

module Protos
  class Card < Component
    ImageDisplayTypes = Types::Coercible::Symbol.enum(:default, :overlay, :side)

    option :border, type: Types::Bool, default: -> { true }, reader: :private
    option :compact, type: Types::Bool, default: -> { false }, reader: :private
    option :image_display,
           ImageDisplayTypes,
           default: -> { :default },
           reader: false

    def template(&block)
      article(**attrs, &block)
    end

    def body(...)
      Body.new(...)
    end

    def image(...)
      Image.new(...)
    end

    def title(...)
      Title.new(...)
    end

    def actions(...)
      Actions.new(...)
    end

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
