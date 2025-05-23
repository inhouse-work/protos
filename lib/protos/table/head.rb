# frozen_string_literal: true

module Protos
  class Table
    class Head < Component
      # DOCS: The head of a table

      ALLIGNMENT = {
        left: "text-left",
        right: "text-right",
        center: "text-center"
      }.freeze

      option :align,
        type: Types::Coercible::Symbol.enum(:left, :center, :right),
        reader: false,
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
