# frozen_string_literal: true

module Protos
  class Command
    class Empty < Component
      # DOCS: The empty component is displayed in the list when there are no
      # matches in an input.

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
          container: %w[
            hidden
            px-xs
            py-sm
          ]
        }
      end
    end
  end
end
