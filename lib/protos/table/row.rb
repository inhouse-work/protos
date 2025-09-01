# frozen_string_literal: true

module Protos
  class Table
    # DOCS: A table row (tr element) that contains cells of data.
    #
    # @example Basic usage
    #   table.row do
    #     table.cell { "Data 1" }
    #     table.cell { "Data 2" }
    #   end
    class Row < Component
      def view_template(&)
        tr(**attrs, &)
      end

      private

      def theme
        {
          container: "print:break-inside-avoid print:break-after-auto"
        }
      end
    end
  end
end
