# frozen_string_literal: true

module Protos
  class Table
    class Head < Component
      def template(&block)
        th(**attrs, &block)
      end
    end
  end
end
