# frozen_string_literal: true

module Protos
  class Table
    class Body < Component
      # DOCS: The body of a table

      def view_template(&)
        tbody(**attrs, &)
      end
    end
  end
end
