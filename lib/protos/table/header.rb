# frozen_string_literal: true

module Protos
  class Table
    class Header < Component
      # DOCS: The header of a table that contains many Protos::Table::Head
      # components

      def view_template(&block)
        thead(**attrs, &block)
      end
    end
  end
end
