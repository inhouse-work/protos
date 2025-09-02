# frozen_string_literal: true

module Protos
  class Table
    # A table header cell (th element) that represents a column header.
    # Can be aligned left, center or right.
    #
    # @example With alignment
    #   table.head(align: :center) { "Centered Header" }
    class Head < Component
      ALLIGNMENT = {
        left: "text-left",
        right: "text-right",
        center: "text-center"
      }.freeze

      # @!attribute [r] align
      #   @return [Symbol] Text alignment - :left, :center or :right
      option :align,
        type: Types::Coercible::Symbol.enum(:left, :center, :right),
        default: -> { :left }

      def view_template(&)
        th(**attrs, &)
      end

      private

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
