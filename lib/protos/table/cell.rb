# frozen_string_literal: true

module Protos
  class Table
    class Cell < Component
      def template(&block)
        td(**attrs, &block)
      end
    end
  end
end
