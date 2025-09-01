# frozen_string_literal: true

module Protos
  class Popover
    # The interactive element that activates the popover when hovered or
    # clicked.
    #
    # @example Basic trigger
    #   popover.trigger { "Hover me" }
    #
    # @example Custom styled trigger
    #   popover.trigger(class: "btn btn-primary") { "Click me" }
    #
    # @note This component:
    #   - Is rendered as a button by default
    #   - Includes necessary data attributes for Stimulus integration
    #   - Is keyboard focusable (tabindex=0)
    #   - Can contain any content (text, icons, etc)
    #
    # @see Protos::Popover The parent popover component for configuration
    #   options
    class Trigger < Component
      def view_template(&)
        button(**attrs, &)
      end

      private

      def default_attrs
        {
          data: { "protos--popover-target": "trigger" },
          tabindex: 0,
          type: :button
        }
      end
    end
  end
end
