# frozen_string_literal: true

module Protos
  class Table
    class Row < Component
      def template(&block)
        tr(**attrs, &block)
      end
    end
  end
end
