# frozen_string_literal: true

module Protos
  class Table
    class Footer < Component
      # DOCS: The footer section of a table (tfoot element) that typically
      # contains summary rows.
      #
      # @example Basic usage
      #   table.footer do
      #     table.row do
      #       table.cell { "Total" }
      #       table.cell { "100" }
      #     end
      #   end

      def view_template(&)
        tfoot(**attrs, &)
      end
    end
  end
end
