# frozen_string_literal: true

module Protos
  # The swap component is a checkbox that can be toggled on and off to
  # display different content.
  #
  # @see https://daisyui.com/components/swap/
  #
  # @example
  #   Protos::Swap.new do |swap|
  #     swap.on { "Content when on" }
  #     swap.off { "Content when off" }
  #   end
  class Swap < Component
    autoload :On, "protos/swap/on"
    autoload :Off, "protos/swap/off"

    # Renders the full swap element.
    #
    # @yield The content block to define the on and off states.
    # @return [nil] outputs to the @buffer
    def view_template
      label(**attrs) do
        input(
          type: :checkbox,
          class: css[:input],
          autocomplete: :off,
          form: "",
          aria_label: "swap"
        )
        yield if block_given?
      end
    end

    # Renders the content that displays when the swap is toggled on.
    #
    # @param (see Protos::Swap::On#initialize)
    # @return [nil]
    def on(...) = render On.new(...)

    # Renders the content that displays when the swap is toggled off.
    #
    # @param (see Protos::Swap::Off#initialize)
    # @return [nil]
    def off(...) = render Off.new(...)

    private

    def theme
      {
        container: "swap"
      }
    end
  end
end
