# frozen_string_literal: true

module Protos
  class Tabs
    # A single tab in a tabs component
    class Tab < Component
      DEFAULT_ATTRS = { role: :tab }.freeze

      option :active, default: -> { false }
      option :disabled, default: -> { false }

      def view_template(&)
        a(**attrs, &)
      end

      private

      def default_attrs = DEFAULT_ATTRS

      def theme
        {
          container: [
            "tab",
            ("tab-disabled" if disabled),
            ("tab-active" if active)
          ]
        }
      end
    end
  end
end
