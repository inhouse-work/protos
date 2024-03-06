# frozen_string_literal: true

module Protos
  class Popover
    class Content < Component
      def template(&block)
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
