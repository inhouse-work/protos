# frozen_string_literal: true

module Protos
  class Table
    # A single cell in a table
    class Cell < Component
      ALLIGNMENT = {
        left: "text-left",
        right: "text-right",
        center: "text-center"
      }.freeze

      option :align,
        type: Types::Coercible::Symbol.enum(:left, :center, :right),
        default: -> { :left }

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
        ALLIGNMENT.fetch(@align)
      end

      def theme
        {
          container: align
        }
      end
    end
  end
end
