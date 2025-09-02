# frozen_string_literal: true

module Protos
  class Diff
    class Item < Component
      Order = Types::Coercible::Symbol.enum(:one, :two)

      ORDER = {
        one: "diff-item-1",
        two: "diff-item-2"
      }.freeze

      # @!attribute [r] order
      # @return [Order]
      option :order, type: Order, default: -> { :one }

      # Renders the diff item container.
      #
      # @yield The content block for the item content.
      # @return [nil] outputs to the @buffer
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
