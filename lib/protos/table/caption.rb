# frozen_string_literal: true

module Protos
  class Table
    class Caption < Component
      def template(&block)
        caption(**attrs, &block)
      end

      private

      def theme
        {
          container: tokens("caption-bottom", "p-sm")
        }
      end
    end
  end
end
