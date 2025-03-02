# frozen_string_literal: true

module Protos
  class Diff
    class Item < Component
      Order = Types::Coercible::Symbol.enum(:one, :two)

      ORDER = {
        one: "diff-item-1",
        two: "diff-item-2"
      }.freeze

      option :order, type: Order, default: -> { :one }, reader: false

      def view_template(&)
        div(**attrs, &)
      end

      private

      def default_attrs
        {
          role: :img
        }
      end

      def theme
        {
          container: ORDER.fetch(@order)
        }
      end
    end
  end
end
