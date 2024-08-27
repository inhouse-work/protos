# frozen_string_literal: true

module Protos
  class Tabs
    class Tab < Component
      # DOCS: A single tab in a tabs component

      option :active, default: -> { false }
      option :disabled, default: -> { false }

      def view_template(&)
        button(**attrs, disabled:, &)
      end

      private

      def default_attrs
        {
          role: :tab
        }
      end

      def theme
        {
          container: tokens(
            "tab",
            disabled: "tab-disabled",
            active: "tab-active"
          )
        }
      end
    end
  end
end
