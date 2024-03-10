# frozen_string_literal: true

module Protos
  class Table
    class Body < Component
      # DOCS: The body of a table

      def template(&block)
        tbody(**attrs, &block)
      end
    end
  end
end
