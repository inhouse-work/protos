# frozen_string_literal: true

module Protos
  class Table
    class Caption < Component
      # DOCS: The caption of a table

      def view_template(&)
        caption(**attrs, &)
      end

      private

      def theme
        {
          container: "caption-bottom"
        }
      end
    end
  end
end
