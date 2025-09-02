# frozen_string_literal: true

module Protos
  class Drawer
    # The content that will be shown when you open the drawer using the
    # trigger. This would be hidden until triggered.
    class Side < Component
      # @!attribute [r] input_id
      #   @return [String] The ID of the associated checkbox input for toggling.
      option :input_id, type: Types::String

      # Renders the drawer side panel.
      #
      # @yield The content block for the side panel content.
      # @return [nil] outputs to the @buffer
      def view_template
        aside(**attrs) do
          label(
            for: input_id,
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
