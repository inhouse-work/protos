# frozen_string_literal: true

module Protos
  class Popover
    class Content < Component
      def template(&block)
        div(**attrs, &block)
      end

      private

      def theme
        {
          container: "dropdown-content"
        }
      end
    end
  end
end
