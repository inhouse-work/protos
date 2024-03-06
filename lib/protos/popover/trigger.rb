# frozen_string_literal: true

module Protos
  class Popover
    class Trigger < Component
      def template(&block)
        div(**attrs, &block)
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
