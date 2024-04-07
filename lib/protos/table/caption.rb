# frozen_string_literal: true

module Protos
  class Table
    class Caption < Component
      # DOCS: The caption of a table

      def view_template(&block)
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
