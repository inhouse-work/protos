# frozen_string_literal: true

module Protos
  class Drawer
    class Side < Component
      # DOCS: The content that will be shown when you open the drawer using the
      # trigger. This would be hidden until triggered.

      option :input_id, reader: false, type: Types::String

      def view_template
        aside(**attrs) do
          label(
            for: @input_id,
            aria_label: "close sidebar",
            class: css[:toggle]
          )
          yield if block_given?
        end
      end

      private

      def theme
        {
          container: %w[
            drawer-side
            z-20
            peer-checked:backdrop-blur-sm
          ],
          toggle: "drawer-overlay"
        }
      end
    end
  end
end
