# frozen_string_literal: true

module Protos
  class Popover
    class Content < Component
      # DOCS: The content of a popover. We use a <template> element that is
      # added to the DOM by tippy.js to handle the position of the content.
      # This means content in here will not be available in system tests that
      # use rack_test.

      def view_template(&block)
        template_tag(**template_attrs) do
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
