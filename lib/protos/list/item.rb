# frozen_string_literal: true

module Protos
  class List
    class Item < Component
      # DOCS: A single item within a list. Items are joined so that borders will
      # work for list items, including border radius. E.g. only the first and
      # last items will have border radius on the top and bottom.

      def view_template(&)
        li(**attrs, &)
      end

      private

      def theme
        {
          container: %w[
            join-item
            [&:not(:first-child)]:border-t-0
          ]
        }
      end
    end
  end
end
