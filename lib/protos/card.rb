# frozen_string_literal: true

module Protos
  class Card < Component
    # DOCS: A card component
    # https://daisyui.com/components/card/

    autoload :Body, "protos/card/body"
    autoload :Title, "protos/card/title"
    autoload :Actions, "protos/card/actions"
    autoload :Image, "protos/card/image"

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
        container: [
          "card",
          image_display,
          ("card-bordered" if border),
          ("card-compact" if compact)
        ]
      }
    end
  end
end
