# frozen_string_literal: true

module Protos
  class Tabs
    # A single tab in a tabs component
    class Tab < Component
      option :active, default: -> { false }
      option :disabled, default: -> { false }

      def view_template(&)
        a(**attrs, &)
      end

      private

      def default_attrs
        {
          role: :tab
        }
      end

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
