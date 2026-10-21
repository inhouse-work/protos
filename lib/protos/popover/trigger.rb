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
    # @example Link trigger
    #   popover.trigger(as: :a, href: "/help") { "Help" }
    #
    # @note This component:
    #   - Is rendered as a button by default
    #   - Can be rendered as another element with the `as` option
    #   - Includes necessary data attributes for Stimulus integration
    #   - Is keyboard focusable (tabindex=0)
    #   - Can contain any content (text, icons, etc)
    #
    # @see Protos::Popover The parent popover component for configuration
    #   options
    class Trigger < Component
      # @!attribute [r] as
      # @return [Symbol] The HTML element to render the trigger as.
      option :as, type: Types::Coercible::Symbol, default: -> { :button }

      def view_template(&)
        send(@as, **attrs, &)
      end

      private

      def default_attrs
        {
          data: { "protos--popover-target": "trigger" },
          tabindex: 0
        }.tap do |attrs|
          attrs[:type] = :button if button?
        end
      end

      def button? = @as == :button
    end
  end
end
