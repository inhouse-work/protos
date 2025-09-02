# frozen_string_literal: true

module Protos
  class List
    # A single item within a list. Items are joined so that borders will
    # work for list items, including border radius. E.g. only the first and
    # last items will have border radius on the top and bottom.
    class Item < Component
      option :wrap, Types::Bool, default: -> { false }
      option :grow, Types::Bool, default: -> { false }

      def view_template(&)
        li(**attrs, &)
      end

      private

      def theme
        {
          container: [
            "list-row",
            ("list-col-wrap" if wrap),
            ("list-col-grow" if grow)
          ]
        }
      end
    end
  end
end
