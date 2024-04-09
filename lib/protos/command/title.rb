# frozen_string_literal: true

module Protos
  class Command
    class Title < Component
      # DOCS: The title for a group of commands. This is expected to be used
      # inside a Protos::Command::Group component.

      def view_template(&)
        h2(**attrs, &)
      end

      private

      def theme
        {
          container: "menu-title"
        }
      end
    end
  end
end
