# frozen_string_literal: true

module Protos
  class Table
    class Body < Component
      # DOCS: The main content area of a table (tbody element) that contains
      # the data rows.
      #
      # @example Basic usage
      #   table.body do
      #     table.row do
      #       table.cell { "John" }
      #       table.cell { "30" }
      #     end
      #   end

      def view_template(&)
        tbody(**attrs, &)
      end
    end
  end
end
