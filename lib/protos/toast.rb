# frozen_string_literal: true

module Protos
  class Toast < Component
    Positions = Types::Symbol.enum(
      :start,
      :center,
      :end,
      :top,
      :middle,
      :bottom
    )

    option :position, type: Positions, default: -> { :end }

    def template(&block)
      dialog(**attrs, &block)
    end

    def close_button(...)
      CloseButton.new(...)
    end

    private

    def default_attrs
      {
        open: true
      }
    end

    def theme
      {
        container: tokens(
          "toast",
          "toast-end",
          "[&:not([open])]:hidden"
        )
      }
    end
  end
end
