# frozen_string_literal: true

module Protos
  class Table
    class Header < Component
      # DOCS: The header section of a table that contains column headers.
      # This wraps one or more Protos::Table::Head components in a thead
      # element.
      #
      # @example Basic usage
      #   table.header do
      #     table.row do
      #       table.head { "Name" }
      #       table.head { "Age" }
      #     end
      #   end

      def view_template(&)
        thead(**attrs, &)
      end

      private

      def theme
        {
          container: "table-header-group"
        }
      end
    end
  end
end
