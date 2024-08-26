# frozen_string_literal: true

module Protos
  class Drawer
    class Trigger < Component
      # DOCS: The trigger for a drawer. When this is clicked the side will open
      # and overlap the main content with a darker overlay.

      option :input_id, reader: false, type: Types::String

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
