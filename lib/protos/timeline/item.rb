# frozen_string_literal: true

module Protos
  class Timeline
    class Item < Component
      # DOCS: The item of a timeline. Usually containing a center, left and
      # right and depending on its position in the list, an hr at the beginning
      # or end.

      def view_template(&block)
        li(**attrs, &block)
      end
    end
  end
end
