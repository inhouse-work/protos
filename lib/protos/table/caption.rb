# frozen_string_literal: true

module Protos
  class Table
    class Caption < Component
      # DOCS: The caption of a table

      SIDES = {
        bottom: "caption-bottom",
        top: "caption-top"
      }.freeze

      option :side,
        reader: false,
        type: Types::Coercible::Symbol.enum(:bottom, :top),
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
