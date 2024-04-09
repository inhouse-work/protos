# frozen_string_literal: true

module Protos
  class Popover
    class Trigger < Component
      # DOCS: The trigger of a popover. This is the element that you would hover
      # or click on to show the popover.

      def view_template(&)
        div(**attrs, &)
      end

      private

      def default_attrs
        {
          data: { "protos--popover-target": "trigger" },
          tabindex: 0
        }
      end
    end
  end
end
