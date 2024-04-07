# frozen_string_literal: true

module Protos
  class Table
    class Footer < Component
      # DOCS: The footer of a table

      def view_template(&block)
        tfoot(**attrs, &block)
      end
    end
  end
end
