# frozen_string_literal: true

module Protos
  class Drawer
    # The trigger for a drawer. When this is clicked the side will open
    # and overlap the main content with a darker overlay.
    class Trigger < Component

      # @!attribute [r] input_id
      #   @return [String] The ID of the associated checkbox input for toggling.
      option :input_id, reader: false, type: Types::String

      # Renders the drawer trigger element.
      #
      # @yield The content block for the trigger (usually button text or icon).
      # @return [nil] outputs to the @buffer
      def view_template(&)
        label(for: @input_id, **attrs, &)
      end

      private

      def theme
        {
          container: "drawer-button"
        }
      end
    end
  end
end
