# frozen_string_literal: true

module Protos
  class Table
    class Head < Component
      option :align,
             type: Types::Coercible::Symbol.enum(:left, :center, :right),
             default: -> {
               :left
             }

      def template(&block)
        th(**attrs, &block)
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
