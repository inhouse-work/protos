# frozen_string_literal: true

module Protos
  class Table
    # DOCS: The caption of a table
    class Caption < Component
      Sides = Types::Coercible::Symbol.enum(:bottom, :top)

      SIDES = {
        bottom: "caption-bottom",
        top: "caption-top"
      }.freeze

      option :side,
        type: Sides,
        default: -> { :bottom }

      def view_template(&)
        caption(**attrs, &)
      end

      private

      def side
        SIDES.fetch(@side)
      end

      def theme
        {
          container: side
        }
      end
    end
  end
end
