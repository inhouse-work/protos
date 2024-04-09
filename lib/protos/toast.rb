# frozen_string_literal: true

module Protos
  class Toast < Component
    # DOCS: A toast component that can be used to display messages to the user
    # that popup at a fixed position on the screen.
    # https://daisyui.com/components/toast/

    Positions = Types::Symbol.enum(
      :top_start,
      :top_center,
      :top_end,
      :middle_start,
      :middle_center,
      :middle_end,
      :bottom_start,
      :bottom_center,
      :bottom_end
    )

    option :position,
           type: Positions,
           default: -> { :bottom_end },
           reader: false

    def view_template(&)
      dialog(**attrs, &)
    end

    def close_button(...) = render CloseButton.new(...)

    private

    def default_attrs
      {
        open: true
      }
    end

    def position
      {
        top_start: "toast-start toast-top",
        top_center: "toast-center toast-top",
        top_end: "toast-end toast-top",
        middle_start: "toast-start toast-middle",
        middle_center: "toast-center toast-middle",
        middle_end: "toast-end toast-middle",
        bottom_start: "toast-start toast-bottom",
        bottom_center: "toast-center toast-bottom",
        bottom_end: "toast-end toast-bottom"
      }.fetch(@position)
    end

    def theme
      {
        container: tokens(
          "toast",
          position,
          "[&:not([open])]:hidden",
          "bg-transparent"
        )
      }
    end
  end
end
