# frozen_string_literal: true

module Protos
  class Table
    class Row < Component
      # DOCS: A table row (tr element) that contains cells of data.
      #
      # @example Basic usage
      #   table.row do
      #     table.cell { "Data 1" }
      #     table.cell { "Data 2" }
      #   end

      def view_template(&)
        tr(**attrs, &)
      end
    end
  end
end
