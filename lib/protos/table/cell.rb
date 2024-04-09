# frozen_string_literal: true

module Protos
  class Table
    class Cell < Component
      # DOCS: A single cell in a table

      option :align,
             type: Types::Coercible::Symbol.enum(:left, :center, :right),
             reader: false,
             default: -> {
               :left
             }

      def view_template(&)
        td(**attrs, &)
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

      def align
        {
          left: "text-left",
          right: "text-right",
          center: "text-center"
        }.fetch(@align)
      end

      def theme
        {
          container: align
        }
      end
    end
  end
end
