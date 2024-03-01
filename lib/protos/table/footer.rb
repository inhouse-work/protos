# frozen_string_literal: true

module Protos
  class Table
    class Footer < Component
      def template(&block)
        tfoot(**attrs, &block)
      end
    end
  end
end
