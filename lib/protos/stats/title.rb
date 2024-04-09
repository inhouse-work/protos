# frozen_string_literal: true

module Protos
  class Stats
    class Title < Component
      # DOCS: A title for a group of stats

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "stat-title"
        }
      end
    end
  end
end
