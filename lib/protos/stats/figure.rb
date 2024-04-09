# frozen_string_literal: true

module Protos
  class Stats
    class Figure < Component
      # DOCS: A figure for a single stat

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: tokens("stat-figure")
        }
      end
    end
  end
end
