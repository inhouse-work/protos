# frozen_string_literal: true

module Protos
  class Command
    # The empty component is displayed in the list when there are no
    # matches in an input.
    class Empty < Component

      # Renders the empty state element.
      #
      # @yield The content block for the empty state message.
      # @return [nil] outputs to the @buffer
      def view_template(&)
        li(**attrs, &)
      end

      private

      def default_attrs
        {
          data: { "protos--command-target": "empty" }
        }
      end

      def theme
        {
          container: "hidden px-xs py-sm"
        }
      end
    end
  end
end
