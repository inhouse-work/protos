# frozen_string_literal: true

module Protos
  class Swap < Component
    # DOCS: The swap component is a checkbox that can be toggled on and off to
    # display different content.
    # https://daisyui.com/components/swap/

    autoload :On, "protos/swap/on"
    autoload :Off, "protos/swap/off"

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

    def on(...) = render On.new(...)

    def off(...) = render Off.new(...)

    private

    def theme
      {
        container: "swap"
      }
    end
  end
end
