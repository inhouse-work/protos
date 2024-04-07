# frozen_string_literal: true

module Protos
  class Drawer
    class Trigger < Component
      # DOCS: The trigger for a drawer. When this is clicked the side will open
      # and overlap the main content with a darker overlay.

      option :id, type: Types::Coercible::String

      def view_template(&block)
        label(for: id, **attrs, &block)
      end

      private

      def theme
        {
          container: tokens("drawer-button")
        }
      end
    end
  end
end
