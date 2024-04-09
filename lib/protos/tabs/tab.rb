# frozen_string_literal: true

module Protos
  class Tabs
    class Tab < Component
      # DOCS: A single tab in a tabs component

      option :id
      option :label
      option :active, default: -> { false }
      option :disabled, default: -> { false }

      def view_template(&)
        input(
          type: :radio,
          class: css[:input],
          name: id,
          role: :tab,
          aria_label: label,
          autocomplete: :off
        )
        div(**attrs, &)
      end

      private

      def default_attrs
        {
          role: :tabpanel
        }
      end

      def theme
        {
          container: tokens("tab-content"),
          input: tokens(
            "tab",
            disabled: "tab-disabled",
            active: "tab-active"
          )
        }
      end
    end
  end
end
