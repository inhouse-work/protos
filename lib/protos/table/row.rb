# frozen_string_literal: true

module Protos
  class Table
    class Row < Component
      # DOCS: The row of a table

      def view_template(&)
        tr(**attrs, &)
      end
    end
  end
end
