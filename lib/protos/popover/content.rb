# frozen_string_literal: true

module Protos
  class Popover
    class Content < Component
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
      #   - Uses a <template> element for Tippy.js positioning
      #   - Content won't be visible in rack_test system tests
      #   - Should contain the actual popover content/structure
      #   - Inherits animations/positioning from parent Popover
      #
      # @todo Consider moving away from template element for better testability
      # @see Protos::Popover The parent popover component for configuration options

      def view_template(&block)
        template(**template_attrs) do
          div(**attrs, &block)
        end
      end

      private

      def template_attrs
        {
          data: {
            "protos--popover-target": "template"
          }
        }
      end
    end
  end
end
