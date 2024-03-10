# frozen_string_literal: true

module Protos
  class Table
    class Cell < Component
      # DOCS: A single cell in a table

      option :align,
             type: Types::Coercible::Symbol.enum(:left, :center, :right),
             default: -> {
               :left
             }

      def template(&block)
        td(**attrs, &block)
      end

      private

      def left?
        align == :left
      end

      def center?
        align == :center
      end

      def right?
        align == :right
      end

      def theme
        {
          container: tokens(
            left?: "text-left",
            right?: "text-right",
            center?: "text-center"
          )
        }
      end
    end
  end
end
