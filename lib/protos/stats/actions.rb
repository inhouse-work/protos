# frozen_string_literal: true

module Protos
  class Stats
    class Actions < Component
      # DOCS: A container for the actions (e.g. buttons) for a group of stats

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: "stat-actions"
        }
      end
    end
  end
end
