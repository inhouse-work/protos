# frozen_string_literal: true

module Protos
  class Table
    class Footer < Component
      # DOCS: The footer of a table

      def view_template(&)
        tfoot(**attrs, &)
      end
    end
  end
end
