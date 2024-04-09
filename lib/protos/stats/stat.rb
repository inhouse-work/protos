# frozen_string_literal: true

module Protos
  class Stats
    class Stat < Component
      # DOCS: A single stat container

      def view_template(&)
        div(**attrs, &)
      end

      private

      def theme
        {
          container: tokens("stat")
        }
      end
    end
  end
end
