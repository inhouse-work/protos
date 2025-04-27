# frozen_string_literal: true

module Protos
  class Tabs
    class Tab < Component
      # DOCS: A single tab in a tabs component

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
