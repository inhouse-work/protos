# frozen_string_literal: true

module Protos
  class Table
    class Row < Component
      # DOCS: The row of a table

      def template(&block)
        tr(**attrs, &block)
      end
    end
  end
end
