# frozen_string_literal: true

module Protos
  class Diff
    class Resizer < Component
      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "diff-resizer"
        }
      end
    end
  end
end
