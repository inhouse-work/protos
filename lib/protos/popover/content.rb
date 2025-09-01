# frozen_string_literal: true

module Protos
  class Popover
    # The content that appears in the popover when triggered.
    #
    # @example Basic content
    #   popover.content { "Popover message" }
    #
    # @example Rich content
    #   popover.content do
    #     div(class: "p-4") do
    #       h3 { "Title" }
    #       p { "Detailed content here" }
    #     end
    #   end
    #
    # @note This component:
    #   - Uses a <div> element for Tippy.js positioning
    #   - Should contain the actual popover content/structure
    #   - Inherits animations/positioning from parent Popover
    #
    # @see Protos::Popover The parent popover component for configuration
    #   options
    class Content < Component
      option :as_template, default: -> { true }

      def view_template(&)
        element(hidden: "true", **template_attrs, &)
      end

      private

      def element(...)
        as_template ? template(...) : div(...)
      end

      def template_attrs
        {
          class: "hidden",
          data: {
            "protos--popover-target": "template"
          }
        }
      end
    end
  end
end
