# frozen_string_literal: true

module Protos
  class Swap < Component
    # DOCS: The swap component is a checkbox that can be toggled on and off to
    # display different content.
    # https://daisyui.com/components/swap/

    def template
      label(**attrs) do
        input(type: :checkbox, class: css[:input], autocomplete: :off)
        yield if block_given?
      end
    end

    def on(...)
      On.new(...)
    end

    def off(...)
      Off.new(...)
    end

    private

    def theme
      {
        container: tokens("swap")
      }
    end
  end
end
