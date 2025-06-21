# frozen_string_literal: true

module Protos
  class Dropdown
    # A single item within a dropdown
    class Item < Component

      # Renders the dropdown item element.
      #
      # @yield The content block for the item.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        li(**attrs, &)
      end
    end
  end
end
