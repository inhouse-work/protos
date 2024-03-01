# frozen_string_literal: true

module Protos
  class Table
    class Header < Component
      def template(&block)
        thead(**attrs, &block)
      end
    end
  end
end
