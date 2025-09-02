# frozen_string_literal: true

module Protos
  # A toast component that can be used to display messages to the user
  # that popup at a fixed position on the screen.
  #
  # @see https://daisyui.com/components/toast/
  #
  # @example
  #   render Protos::Toast.new(position: :top_center) do |toast|
  #     div(class: "alert alert-success") do
  #       span { "Success message!" }
  #       toast.close_button { "×" }
  #     end
  #   end
  class Toast < Component
    autoload :CloseButton, "protos/toast/close_button"

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

    POSITIONS = {
      top_start: "toast-start toast-top",
      top_center: "toast-center toast-top",
      top_end: "toast-end toast-top",
      middle_start: "toast-start toast-middle",
      middle_center: "toast-center toast-middle",
      middle_end: "toast-end toast-middle",
      bottom_start: "toast-start toast-bottom",
      bottom_center: "toast-center toast-bottom",
      bottom_end: "toast-end toast-bottom"
    }.freeze

    # @!attribute [r] position
    # @return [Positions]
    option :position,
      type: Positions,
      default: -> { :bottom_end }

    # Renders the toast element.
    #
    # @yield The content block for the toast message.
    # @return [nil] outputs to the @buffer
    def view_template(&)
      dialog(**attrs, &)
    end

    # Renders a close button for the toast.
    #
    # @param (see Protos::Toast::CloseButton#initialize)
    # @return [nil]
    def close_button(...) = render CloseButton.new(...)

    private

    def default_attrs
      {
        open: true
      }
    end

    def theme
      {
        container: [
          "toast [&:not([open])]:hidden bg-transparent",
          POSITIONS.fetch(@position)
        ]
      }
    end
  end
end
